gg.toast("🔄 Conectando ao servidor... Aguarde")

local URL = "https://leomdzxtream.x10.mx/api_login.php"
local SAVE_PATH = gg.getFile():gsub("[^/]+$", "") .. "login_leo.dat"

local function salvarLogin(user, pass)
    local file = io.open(SAVE_PATH, "w")
    if file then
        file:write(user .. "\n" .. pass)
        file:close()
    end
end

local function carregarLogin()
    local file = io.open(SAVE_PATH, "r")
    if file then
        local user = file:read("*l")
        local pass = file:read("*l")
        file:close()
        if user and pass then
            return user, pass
        end
    end
    return nil, nil
end

local savedUser, savedPass = carregarLogin()
local user, pass

if savedUser and savedPass then
    local escolha = gg.choice(
        {"✅ Usar login salvo ("..savedUser..")", "🔑 Fazer novo login"},
        nil,
        "🔐 Login salvo encontrado"
    )

    if escolha == 1 then
        user = savedUser
        pass = savedPass
    elseif escolha == 2 then
        local input = gg.prompt(
            {"👤 Usuário:", "🔑 Senha:"},
            nil,
            {"text", "text"}
        )
        if not input then
            gg.alert("❌ Login cancelado pelo usuário.")
            os.exit()
        end
        user = input[1]
        pass = input[2]
    else
        os.exit()
    end
else
    local input = gg.prompt(
        {"👤 Usuário:", "🔑 Senha:"},
        nil,
        {"text", "text"}
    )
    if not input then
        gg.alert("❌ Login cancelado pelo usuário.")
        os.exit()
    end
    user = input[1]
    pass = input[2]
end

if user == "" or pass == "" then
    gg.alert("⚠️ Preencha todos os campos para continuar.")
    os.exit()
end

local data = "usuario="..user.."&senha="..pass
local resposta = gg.makeRequest(URL, nil, data)

if not resposta or not resposta.content then
    gg.alert("🌐 Erro de conexão!\n\nNão foi possível se comunicar com o servidor.\nVerifique sua internet.")
    os.exit()
end

local retorno = resposta.content
retorno = retorno:gsub("%s+", "")

if retorno == "invalido" then
    gg.alert("❌ Usuário ou senha incorretos!\n\nVerifique seus dados e tente novamente.")
    os.exit()
end

if retorno == "banido" then
    gg.alert("🚫 Conta Banida!\n\nSeu acesso foi bloqueado.\nEntre em contato com o suporte.")
    os.exit()
end

if retorno == "expirado" then
    gg.alert("⏳ Acesso Expirado!\n\nSeu plano venceu.\nRenove para continuar utilizando.")
    os.exit()
end

if retorno == "limite" then
    gg.alert("📱 Limite de Dispositivos Atingido!\n\nVocê já atingiu o número máximo de aparelhos permitidos.\nSe trocou de celular, solicite um reset ao suporte.")
    os.exit()
end

if retorno == "dispositivo" then
    gg.alert("🚨 Dispositivo Não Permitido!\n\nEste aparelho não está autorizado para esta conta.\nCaso seja um novo dispositivo, entre em contato com o suporte.")
    os.exit()
end

if string.sub(retorno,1,2) == "ok" then
    
    local partes = {}
    for s in string.gmatch(retorno, "([^|]+)") do
        table.insert(partes, s)
    end
    
    salvarLogin(user, pass)

    gg.toast("✅ Login autorizado com sucesso!")

    if partes[2] and partes[2] ~= "" then
        gg.alert("📢 AVISO IMPORTANTE:\n\n"..partes[2])
    end

else
    gg.alert("⚠️ Erro inesperado no servidor!\n\nTente novamente mais tarde.")
    os.exit()
end

gg.alert("🔥 Bem-vindo ao Script!\n\nSistema autenticado com sucesso.\nBom uso!")

-- ╔══════════════════════════════════╗
-- ║     😶‍🌫️SCRIPT COMPLETO😶‍🌫️     ║
-- ║    Teleportes + Setar Vida + Farm ║
-- ║         + SISTEMA DE ARMAS        ║
-- ╚══════════════════════════════════╝
-- 🤳 CRIADORES: LZINMODZYTT, DANIEL MODZ 🤳

-- ================= VARIÁVEIS DE VIDA =================
local vida_addr = nil

-- ================= VARIÁVEIS DO FARM LENHADOR =================
local checkpointsLenhador = {}  -- Array para 8 checkpoints
local farmLenhadorAtivo = false
local checkpointLenhadorAtual = 1
local cicloLenhadorAtual = 1
local tempoEntreCiclosLenhador = 30000  -- 30 segundos entre ciclos
local tempoEntreCheckpointsLenhador = 1000  -- 1 segundo entre checkpoints

-- ================= VARIÁVEIS DO FARM PETRÓLEO =================
local checkpointsPetroleo = {}  -- Array para 5 checkpoints
local farmPetroleoAtivo = false
local checkpointPetroleoAtual = 1
local cicloPetroleoAtual = 1
local tempoEntreCiclosPetroleo = 30000  -- 30 segundos entre ciclos
local tempoEntreCheckpointsPetroleo = 1000  -- 1 segundo entre checkpoints

-- ================= VARIÁVEIS DO FARM FÁBRICA DE MÓVEIS =================
local checkpointsFabrica = {}  -- Array para 2 checkpoints
local farmFabricaAtivo = false
local checkpointFabricaAtual = 1
local cicloFabricaAtual = 1
local tempoEntreCiclosFabrica = 30000  -- 30 segundos entre ciclos
local tempoEntreCheckpointsFabrica = 1000  -- 1 segundo entre checkpoints

-- ================= VARIÁVEIS DE ARMAS =================
local guns = {}
local weaponCache = {
   baseAddress = nil,
   lastValues = {},
   lastOffsets = {}
}

-- Configurações de armas
local weaponSettings = {
   searchValue = 99999.9921875,
   maxAttempts = 3,
   searchDelay = 150,
   validationThreshold = 0.001,
   autoFreeze = false
}

-- Tabela de armas com offsets
local weapon = {
   -- Pistolas
   colt45_w        = {{22, 0x70},  {346, 0x78},  {99999, 0x7C}},
   silenciada_w    = {{23, 0x70},  {347, 0x78},  {99999, 0x7C}},
   eagle_w         = {{24, 0x70},  {348, 0x78},  {99999, 0x7C}},

   -- Escopetas
   espingarda_w         = {{25, 0x90},  {349, 0x98},  {99999, 0x9C}},
   espingardacerrada_w  = {{26, 0x90},  {350, 0x98},  {99999, 0x9C}},
   espingardadcombate_w = {{27, 0x90},  {351, 0x98},  {99999, 0x9C}},

   -- Submetralhadoras
   uzi_w           = {{28, 0xB0},  {352, 0xB8},  {99999, 0xBC}},
   mp5_w           = {{29, 0xB0},  {353, 0xB8},  {99999, 0xBC}},
   tec9_w          = {{32, 0xB0},  {354, 0xB8},  {99999, 0xBC}},

   -- Rifles
   rifle_w         = {{33, 0xF0},  {355, 0xF8},  {99999, 0xFC}},
   sniper_w        = {{34, 0xF0},  {356, 0xF8},  {99999, 0xFC}},

   -- Fuzil de assalto
   ak47_w          = {{30, 0xD0},  {355, 0xD8},  {99999, 0xDC}},
   m4_w            = {{31, 0xD0},  {356, 0xD8},  {99999, 0xDC}},

   -- Armas Pesadas
   rpg_w           = {{35, 0x110}, {357, 0x118}, {99999, 0x11C}},
   lanca_chamas_w  = {{37, 0x110}, {359, 0x118}, {99999, 0x11C}},
   minigun_w       = {{38, 0x110}, {360, 0x118}, {99999, 0x11C}},

   -- Armas Brancas
   faca_w          = {{4,  0x50},  {335, 0x58},  {99999, 0x5C}},
   cassetete_w     = {{3,  0x50},  {334, 0x58},  {99999, 0x5C}},
   katana_w        = {{8,  0x50},  {339, 0x58},  {99999, 0x5C}},
   tacobeisebol_w  = {{5,  0x50},  {336, 0x58},  {99999, 0x5C}},
   tacogolf_w      = {{2,  0x50},  {333, 0x58},  {99999, 0x5C}},
   pa_w            = {{6,  0x50},  {337, 0x58},  {99999, 0x5C}},
   tacosinuca_w    = {{7,  0x50},  {338, 0x58},  {99999, 0x5C}},
   serrote_w       = {{9,  0x50},  {340, 0x58},  {99999, 0x5C}},

   -- Visores Especiais
   nightvision_w   = {{44, 0x190}, {368, 0x198}, {99999, 0x19C}},
   thermalvision_w = {{45, 0x190}, {369, 0x198}, {99999, 0x19C}},
   paraquedas_w    = {{46, 0x190}, {370, 0x198}, {99999, 0x19C}},

   -- Explosivos / Projéteis
   granada_w       = {{16, 0x130}, {361, 0x138}, {99999, 0x13C}},
   lacrimogeno_w   = {{17, 0x130}, {362, 0x138}, {99999, 0x13C}},
   molotov_w       = {{18, 0x130}, {363, 0x138}, {99999, 0x13C}},
   satchel_w       = {{39, 0x130}, {364, 0x138}, {99999, 0x13C}},

   -- Itens Especiais
   spray_w         = {{41, 0x150}, {365, 0x158}, {99999, 0x15C}},
   extintor_w      = {{42, 0x150}, {366, 0x158}, {99999, 0x15C}},
   camera_w        = {{43, 0x150}, {367, 0x158}, {99999, 0x15C}},

   -- Presentes
   dildo1_w        = {{10, 0x170}, {341, 0x178}, {99999, 0x17C}},
   dildo2_w        = {{11, 0x170}, {342, 0x178}, {99999, 0x17C}},
   vibrador_w      = {{12, 0x170}, {343, 0x178}, {99999, 0x17C}},
   flores_w        = {{14, 0x170}, {344, 0x178}, {99999, 0x17C}},
   bengala_w       = {{15, 0x170}, {345, 0x178}, {99999, 0x17C}}
}

-- ================= FUNÇÃO PARA MINIMIZAR =================
function minimizar()
    gg.setVisible(false)
    gg.toast("📱 Script em execução... Toque no ícone do GG para abrir o menu")
end

-- ================= FUNÇÃO DOS CRIADORES =================
function menuCriadores()
    gg.alert(
        "╔════════════════════════════╗\n" ..
        "║       🤳 CRIADORES 🤳      ║\n" ..
        "╠════════════════════════════╣\n" ..
        "║                            ║\n" ..
        "║    👑 LZINMODZYTT 👑       ║\n" ..
        "║                            ║\n" ..
        "║    🔥 DANIEL MODZ 🔥        ║\n" ..
        "║     👺LEO MODZ 👺         ║\n" ..
        "╠════════════════════════════╣\n" ..
        "║  Obrigado por usar nosso   ║\n" ..
        "║         script!            ║\n" ..
        "╚════════════════════════════╝"
    )
    mainMenu()
end

-- ================= MENU PRINCIPAL =================
function mainMenu()
    gg.setVisible(false)
    local choice = gg.choice({
        "💪 SETAR VIDA",
        "🚩 TP GPS",
        "💾 SALVAR POSIÇÃO ATUAL",
        "📌 TP POSIÇÃO SALVA",
        "🏭 MENU FARM FÁBRICA",
        "💥 MENU FARM LENHA",
        "🏭 AUTO FARM FÁBRICA DE MÓVEIS (2 CPs)",
        "🔫 MENU DE ARMAS",
        "🤳 CRIADORES",
        "📱 MINIMIZAR",
        "❌ SAIR"
    }, nil, "LEO MENU LIVE RÚSSIA @LEO MODZ")

    if choice == 1 then
        setarVida()
    elseif choice == 2 then
        teleportByCheckpoint()
    elseif choice == 3 then
        savePosition()
    elseif choice == 4 then
        teleportToSavedPosition()
    elseif choice == 5 then
        menuFarmLenhador()
    elseif choice == 6 then
        menuFarmPetroleo()
    elseif choice == 7 then
        menuAutoFarmFabrica()
    elseif choice == 8 then
        menuArmas()
    elseif choice == 9 then
        menuCriadores()
    elseif choice == 10 then
        minimizar()
    elseif choice == 11 or choice == nil then
        os.exit()
    end
end

-- ================= FUNÇÃO SETAR VIDA =================
function setarVida()
    local input = gg.prompt(
        {"🔸 FALA A QTD DE VIDA Q TU QUER:"},
        {999},
        {"number"}
    )

    if input == nil then
        gg.toast("🚫 CANCELOU? MANÉZINHO EH MLK!")
        return
    end

    local valor_vida = tonumber(input[1])
    if not valor_vida or valor_vida <= 0 then
        gg.toast("💩 MANÉ, ISSO NÃO É UM NÚMERO VÁLIDO!")
        return
    end

    local vida_maxima = 99999
    if valor_vida > vida_maxima then
        valor_vida = vida_maxima
        gg.toast("💡 AJUSTADU PRO MAXIMO: " .. valor_vida .. "\nFICA LIGADU, MLK!")
    end

    local vida_base = 99999.9921875

    -- Se ainda não achou o endereço, busca
    if vida_addr == nil then
        gg.clearResults()
        gg.setRanges(gg.REGION_C_ALLOC)
        gg.searchNumber(vida_base, gg.TYPE_FLOAT)
        local results = gg.getResults(1)

        if #results == 0 then
            gg.toast("❌ NÃO ACHOU A VIDA, TÁ TUDO ERRADU!")
            return
        end

        vida_addr = results[1].address
    end

    -- Editar o valor da vida
    gg.setValues({
        {
            address = vida_addr - 0x54,
            flags = gg.TYPE_FLOAT,
            value = valor_vida
        }
    })

    gg.toast("✅ VIDA AJUSTADA, BIXÃO! AGORA TU TÁ COM: " .. valor_vida .. " PONTOS!")
    
    gg.sleep(1000)
    mainMenu()
end

-- ================= MENU AUTO FARM FÁBRICA DE MÓVEIS =================
function menuAutoFarmFabrica()
    local choice = gg.choice({
        "📌 Salvar Checkpoint 1 (Ponto A)",
        "📌 Salvar Checkpoint 2 (Ponto B)",
        "▶️ INICIAR FARM (2 checkpoints)",
        "⏹️ PARAR FARM",
        "⚙️ Configurar Tempos",
        "📋 Ver Checkpoints Salvos",
        "🤳 CRIADORES",
        "📱 MINIMIZAR",
        "↩️ Voltar"
    }, nil, "🏭 AUTO FARM FÁBRICA - 2 CHECKPOINTS")

    if choice == 1 then
        salvarCheckpointFabrica(1, "A")
    elseif choice == 2 then
        salvarCheckpointFabrica(2, "B")
    elseif choice == 3 then
        iniciarFarmFabrica()
    elseif choice == 4 then
        pararFarmFabrica()
    elseif choice == 5 then
        configurarTemposFarmFabrica()
    elseif choice == 6 then
        verCheckpointsFabrica()
    elseif choice == 7 then
        menuCriadores()
    elseif choice == 8 then
        minimizar()
    elseif choice == 9 then
        mainMenu()
    end
end

function salvarCheckpointFabrica(numero, ponto)
    if not savePlayerCoords() then
        gg.toast("❌ Erro ao salvar checkpoint")
        menuAutoFarmFabrica()
        return
    end
    
    local saved = getSavedCoords()
    if saved then
        checkpointsFabrica[numero] = {
            x = saved.x.value,
            y = saved.y.value,
            z = saved.z.value,
            nome = "Ponto " .. ponto
        }
        gg.toast(string.format("✅ Checkpoint %d - Ponto %s salvo!", numero, ponto))
    else
        gg.toast("❌ Erro ao obter coordenadas")
    end
    
    gg.sleep(1500)
    menuAutoFarmFabrica()
end

function verCheckpointsFabrica()
    local msg = "📊 CHECKPOINTS FÁBRICA:\n\n"
    local totalSalvos = 0
    
    for i = 1, 2 do
        if checkpointsFabrica[i] then
            local ponto = (i == 1) and "A (Coletar)" or "B (Entregar)"
            msg = msg .. string.format("✅ CP%d - %s: X=%.2f Y=%.2f Z=%.2f\n", 
                i, ponto, checkpointsFabrica[i].x, checkpointsFabrica[i].y, checkpointsFabrica[i].z)
            totalSalvos = totalSalvos + 1
        else
            local ponto = (i == 1) and "A (Coletar)" or "B (Entregar)"
            msg = msg .. "❌ CP" .. i .. " - " .. ponto .. ": Vazio\n"
        end
    end
    
    msg = msg .. "\nTotal: " .. totalSalvos .. "/2 checkpoints"
    
    gg.alert(msg)
    menuAutoFarmFabrica()
end

function configurarTemposFarmFabrica()
    local input = gg.prompt({
        "⏱️ Tempo entre ciclos (segundos):",
        "⏱️ Tempo entre checkpoints (segundos):"
    }, {
        tempoEntreCiclosFabrica / 1000,
        tempoEntreCheckpointsFabrica / 1000
    }, {"number", "number"})
    
    if input then
        tempoEntreCiclosFabrica = input[1] * 1000
        tempoEntreCheckpointsFabrica = input[2] * 1000
        gg.toast(string.format("✅ Tempos configurados:\nCiclo: %.1fs | CP: %.1fs", 
            input[1], input[2]))
    end
    
    gg.sleep(1500)
    menuAutoFarmFabrica()
end

function iniciarFarmFabrica()
    -- Verificar se os 2 checkpoints estão salvos
    if not checkpointsFabrica[1] or not checkpointsFabrica[2] then
        gg.alert("❌ Você precisa salvar os 2 checkpoints primeiro!\n\nCP1: Ponto A (Coletar)\nCP2: Ponto B (Entregar)")
        menuAutoFarmFabrica()
        return
    end
    
    if not savePlayerCoords() then
        gg.toast("❌ Erro ao preparar farm")
        menuAutoFarmFabrica()
        return
    end
    
    farmFabricaAtivo = true
    checkpointFabricaAtual = 1
    cicloFabricaAtual = 1
    
    gg.alert(string.format("🏭 FARM FÁBRICA INICIADO!\n\n2 Checkpoints configurados\nCP1: Ponto A (Coletar)\nCP2: Ponto B (Entregar)\n\nTempo entre ciclos: %.1fs\nTempo entre CPs: %.1fs", 
        tempoEntreCiclosFabrica/1000, tempoEntreCheckpointsFabrica/1000))
    
    gg.sleep(1000)
    executarFarmFabrica()
end

function executarFarmFabrica()
    local saved = getSavedCoords()
    if not saved then
        gg.toast("❌ Erro: coordenadas não encontradas")
        farmFabricaAtivo = false
        mainMenu()
        return
    end
    
    while farmFabricaAtivo do
        gg.toast(string.format("🏭 CICLO %d INICIADO", cicloFabricaAtual))
        
        -- Ponto A (Coletar)
        if farmFabricaAtivo then
            local checkpoint = checkpointsFabrica[1]
            saved.x.value = checkpoint.x
            saved.y.value = checkpoint.y
            saved.z.value = checkpoint.z
            gg.setValues({saved.x, saved.y, saved.z})
            
            gg.toast(string.format("🏭 Ciclo %d - Ponto A (Coletar)", cicloFabricaAtual))
            gg.sleep(tempoEntreCheckpointsFabrica)
        end
        
        -- Ponto B (Entregar)
        if farmFabricaAtivo then
            local checkpoint = checkpointsFabrica[2]
            saved.x.value = checkpoint.x
            saved.y.value = checkpoint.y
            saved.z.value = checkpoint.z
            gg.setValues({saved.x, saved.y, saved.z})
            
            gg.toast(string.format("🏭 Ciclo %d - Ponto B (Entregar)", cicloFabricaAtual))
        end
        
        if farmFabricaAtivo then
            cicloFabricaAtual = cicloFabricaAtual + 1
            gg.toast(string.format("✅ Ciclo %d concluído! Aguardando...", cicloFabricaAtual-1))
            gg.sleep(tempoEntreCiclosFabrica)
        end
    end
end

function pararFarmFabrica()
    farmFabricaAtivo = false
    gg.toast("⏹️ Farm Fábrica parado!")
    gg.sleep(1000)
    menuAutoFarmFabrica()
end

-- ================= MENU FARM LENHADOR =================
function menuFarmLenhador()
    local choice = gg.choice({
        "📌 Salvar Checkpoint 1",
        "📌 Salvar Checkpoint 2",
        "📌 Salvar Checkpoint 3",
        "📌 Salvar Checkpoint 4",
        "📌 Salvar Checkpoint 5",
        "📌 Salvar Checkpoint 6",
        "📌 Salvar Checkpoint 7",
        "📌 Salvar Checkpoint 8",
        "▶️ INICIAR FARM (8 checkpoints)",
        "⏹️ PARAR FARM",
        "⚙️ Configurar Tempos",
        "📋 Ver Checkpoints Salvos",
        "🤳 CRIADORES",
        "📱 MINIMIZAR",
        "↩️ Voltar"
    }, nil, "FARM FÁBRICA - 8 CHECKPOINTS")

    if choice >= 1 and choice <= 8 then
        salvarCheckpointLenhador(choice)
    elseif choice == 9 then
        iniciarFarmLenhador()
    elseif choice == 10 then
        pararFarmLenhador()
    elseif choice == 11 then
        configurarTemposFarmLenhador()
    elseif choice == 12 then
        verCheckpointsLenhador()
    elseif choice == 13 then
        menuCriadores()
    elseif choice == 14 then
        minimizar()
    elseif choice == 15 then
        mainMenu()
    end
end

function salvarCheckpointLenhador(numero)
    if not savePlayerCoords() then
        gg.toast("❌ Erro ao salvar checkpoint")
        menuFarmLenhador()
        return
    end
    
    local saved = getSavedCoords()
    if saved then
        checkpointsLenhador[numero] = {
            x = saved.x.value,
            y = saved.y.value,
            z = saved.z.value
        }
        gg.toast(string.format("✅ Checkpoint %d salvo!", numero))
    else
        gg.toast("❌ Erro ao obter coordenadas")
    end
    
    gg.sleep(1500)
    menuFarmLenhador()
end

function verCheckpointsLenhador()
    local msg = "📊 CHECKPOINTS LENHADOR:\n\n"
    local totalSalvos = 0
    
    for i = 1, 8 do
        if checkpointsLenhador[i] then
            msg = msg .. string.format("✅ CP%d: X=%.2f Y=%.2f Z=%.2f\n", 
                i, checkpointsLenhador[i].x, checkpointsLenhador[i].y, checkpointsLenhador[i].z)
            totalSalvos = totalSalvos + 1
        else
            msg = msg .. "❌ CP" .. i .. ": Vazio\n"
        end
    end
    
    msg = msg .. "\nTotal: " .. totalSalvos .. "/8 checkpoints"
    
    gg.alert(msg)
    menuFarmLenhador()
end

function configurarTemposFarmLenhador()
    local input = gg.prompt({
        "⏱️ Tempo entre ciclos (segundos):",
        "⏱️ Tempo entre checkpoints (segundos):"
    }, {
        tempoEntreCiclosLenhador / 1000,
        tempoEntreCheckpointsLenhador / 1000
    }, {"number", "number"})
    
    if input then
        tempoEntreCiclosLenhador = input[1] * 1000
        tempoEntreCheckpointsLenhador = input[2] * 1000
        gg.toast(string.format("✅ Tempos configurados:\nCiclo: %.1fs | CP: %.1fs", 
            input[1], input[2]))
    end
    
    gg.sleep(1500)
    menuFarmLenhador()
end

function iniciarFarmLenhador()
    -- Verificar se todos os 8 checkpoints estão salvos
    local todosSalvos = true
    for i = 1, 8 do
        if not checkpointsLenhador[i] then
            todosSalvos = false
            break
        end
    end
    
    if not todosSalvos then
        gg.alert("❌ Você precisa salvar todos os 8 checkpoints primeiro!")
        menuFarmLenhador()
        return
    end
    
    if not savePlayerCoords() then
        gg.toast("❌ Erro ao preparar farm")
        menuFarmLenhador()
        return
    end
    
    farmLenhadorAtivo = true
    checkpointLenhadorAtual = 1
    cicloLenhadorAtual = 1
    
    gg.alert(string.format("🚀 FARM LENHADOR INICIADO!\n\n8 Checkpoints configurados\nTempo entre ciclos: %.1fs\nTempo entre CPs: %.1fs", 
        tempoEntreCiclosLenhador/1000, tempoEntreCheckpointsLenhador/1000))
    
    gg.sleep(1000)
    executarFarmLenhador()
end

function executarFarmLenhador()
    local saved = getSavedCoords()
    if not saved then
        gg.toast("❌ Erro: coordenadas não encontradas")
        farmLenhadorAtivo = false
        mainMenu()
        return
    end
    
    while farmLenhadorAtivo do
        gg.toast(string.format("🪓 CICLO %d INICIADO", cicloLenhadorAtual))
        
        for cp = 1, 8 do
            if not farmLenhadorAtivo then break end
            
            local checkpoint = checkpointsLenhador[cp]
            
            saved.x.value = checkpoint.x
            saved.y.value = checkpoint.y
            saved.z.value = checkpoint.z
            gg.setValues({saved.x, saved.y, saved.z})
            
            gg.toast(string.format("🪓 Ciclo %d - Checkpoint %d/8", cicloLenhadorAtual, cp))
            
            if cp < 8 then
                gg.sleep(tempoEntreCheckpointsLenhador)
            end
        end
        
        if farmLenhadorAtivo then
            cicloLenhadorAtual = cicloLenhadorAtual + 1
            gg.toast(string.format("✅ Ciclo %d concluído! Aguardando...", cicloLenhadorAtual-1))
            gg.sleep(tempoEntreCiclosLenhador)
        end
    end
end

function pararFarmLenhador()
    farmLenhadorAtivo = false
    gg.toast("⏹️ Farm Lenhador parado!")
    gg.sleep(1000)
    menuFarmLenhador()
end

-- ================= MENU FARM PETRÓLEO =================
function menuFarmPetroleo()
    local choice = gg.choice({
        "📌 Salvar Checkpoint 1",
        "📌 Salvar Checkpoint 2",
        "📌 Salvar Checkpoint 3",
        "📌 Salvar Checkpoint 4",
        "📌 Salvar Checkpoint 5",
        "▶️ INICIAR FARM (5 checkpoints)",
        "⏹️ PARAR FARM",
        "⚙️ Configurar Tempos",
        "📋 Ver Checkpoints Salvos",
        "🤳 CRIADORES",
        "📱 MINIMIZAR",
        "↩️ Voltar"
    }, nil, "🛢️ FARM LENHADOR - 5 CHECKPOINTS")

    if choice >= 1 and choice <= 5 then
        salvarCheckpointPetroleo(choice)
    elseif choice == 6 then
        iniciarFarmPetroleo()
    elseif choice == 7 then
        pararFarmPetroleo()
    elseif choice == 8 then
        configurarTemposFarmPetroleo()
    elseif choice == 9 then
        verCheckpointsPetroleo()
    elseif choice == 10 then
        menuCriadores()
    elseif choice == 11 then
        minimizar()
    elseif choice == 12 then
        mainMenu()
    end
end

function salvarCheckpointPetroleo(numero)
    if not savePlayerCoords() then
        gg.toast("❌ Erro ao salvar checkpoint")
        menuFarmPetroleo()
        return
    end
    
    local saved = getSavedCoords()
    if saved then
        checkpointsPetroleo[numero] = {
            x = saved.x.value,
            y = saved.y.value,
            z = saved.z.value
        }
        gg.toast(string.format("✅ Checkpoint Petróleo %d salvo!", numero))
    else
        gg.toast("❌ Erro ao obter coordenadas")
    end
    
    gg.sleep(1500)
    menuFarmPetroleo()
end

function verCheckpointsPetroleo()
    local msg = "📊 CHECKPOINTS PETRÓLEO:\n\n"
    local totalSalvos = 0
    
    for i = 1, 5 do
        if checkpointsPetroleo[i] then
            msg = msg .. string.format("✅ CP%d: X=%.2f Y=%.2f Z=%.2f\n", 
                i, checkpointsPetroleo[i].x, checkpointsPetroleo[i].y, checkpointsPetroleo[i].z)
            totalSalvos = totalSalvos + 1
        else
            msg = msg .. "❌ CP" .. i .. ": Vazio\n"
        end
    end
    
    msg = msg .. "\nTotal: " .. totalSalvos .. "/5 checkpoints"
    
    gg.alert(msg)
    menuFarmPetroleo()
end

function configurarTemposFarmPetroleo()
    local input = gg.prompt({
        "⏱️ Tempo entre ciclos (segundos):",
        "⏱️ Tempo entre checkpoints (segundos):"
    }, {
        tempoEntreCiclosPetroleo / 1000,
        tempoEntreCheckpointsPetroleo / 1000
    }, {"number", "number"})
    
    if input then
        tempoEntreCiclosPetroleo = input[1] * 1000
        tempoEntreCheckpointsPetroleo = input[2] * 1000
        gg.toast(string.format("✅ Tempos configurados:\nCiclo: %.1fs | CP: %.1fs", 
            input[1], input[2]))
    end
    
    gg.sleep(1500)
    menuFarmPetroleo()
end

function iniciarFarmPetroleo()
    -- Verificar se todos os 5 checkpoints estão salvos
    local todosSalvos = true
    for i = 1, 5 do
        if not checkpointsPetroleo[i] then
            todosSalvos = false
            break
        end
    end
    
    if not todosSalvos then
        gg.alert("❌ Você precisa salvar todos os 5 checkpoints primeiro!")
        menuFarmPetroleo()
        return
    end
    
    if not savePlayerCoords() then
        gg.toast("❌ Erro ao preparar farm")
        menuFarmPetroleo()
        return
    end
    
    farmPetroleoAtivo = true
    checkpointPetroleoAtual = 1
    cicloPetroleoAtual = 1
    
    gg.alert(string.format("🛢️ FARM PETRÓLEO INICIADO!\n\n5 Checkpoints configurados\nTempo entre ciclos: %.1fs\nTempo entre CPs: %.1fs", 
        tempoEntreCiclosPetroleo/1000, tempoEntreCheckpointsPetroleo/1000))
    
    gg.sleep(1000)
    executarFarmPetroleo()
end

function executarFarmPetroleo()
    local saved = getSavedCoords()
    if not saved then
        gg.toast("❌ Erro: coordenadas não encontradas")
        farmPetroleoAtivo = false
        mainMenu()
        return
    end
    
    while farmPetroleoAtivo do
        gg.toast(string.format("🛢️ CICLO %d INICIADO", cicloPetroleoAtual))
        
        for cp = 1, 5 do
            if not farmPetroleoAtivo then break end
            
            local checkpoint = checkpointsPetroleo[cp]
            
            saved.x.value = checkpoint.x
            saved.y.value = checkpoint.y
            saved.z.value = checkpoint.z
            gg.setValues({saved.x, saved.y, saved.z})
            
            gg.toast(string.format("🛢️ Ciclo %d - Checkpoint %d/5", cicloPetroleoAtual, cp))
            
            if cp < 5 then
                gg.sleep(tempoEntreCheckpointsPetroleo)
            end
        end
        
        if farmPetroleoAtivo then
            cicloPetroleoAtual = cicloPetroleoAtual + 1
            gg.toast(string.format("✅ Ciclo %d concluído! Aguardando...", cicloPetroleoAtual-1))
            gg.sleep(tempoEntreCiclosPetroleo)
        end
    end
end

function pararFarmPetroleo()
    farmPetroleoAtivo = false
    gg.toast("⏹️ Farm Petróleo parado!")
    gg.sleep(1000)
    menuFarmPetroleo()
end

-- ================= FUNÇÕES DE COORDENADAS =================
function savePlayerCoords()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("4574729552438491892", gg.TYPE_QWORD)
    gg.refineNumber("4574729552438491892")
    local results = gg.getResults(3)

    if #results > 0 then
        local baseAddr = results[1].address
        local x = { address = baseAddr + (15 * 8), flags = gg.TYPE_FLOAT, value = 0, name = "X" }
        local y = { address = baseAddr + (15.5 * 8), flags = gg.TYPE_FLOAT, value = 0, name = "Y" }
        local z = { address = baseAddr + (14.5 * 8), flags = gg.TYPE_FLOAT, value = 0, name = "Z" }

        local vals = gg.getValues({x, y, z})
        x.value = vals[1].value
        y.value = vals[2].value
        z.value = vals[3].value

        gg.addListItems({x, y, z})
        return true
    else
        gg.toast("❌ Não foi possível salvar coordenadas")
        return false
    end
end

function getSavedCoords()
    local list = gg.getListItems()
    local coords = { x = nil, y = nil, z = nil }
    for _, v in ipairs(list) do
        if v.name == "X" then coords.x = v end
        if v.name == "Y" then coords.y = v end
        if v.name == "Z" then coords.z = v end
    end
    if coords.x and coords.y and coords.z then
        return coords
    else
        return nil
    end
end

-- ================= FUNÇÕES DE TELEPORTE =================
function savePosition()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("4574729552438491892", gg.TYPE_QWORD)
    gg.refineNumber("4574729552438491892")
    local results = gg.getResults(3)

    if #results > 0 then
        local baseAddr = results[1].address
        local savedPos = {
            { address = baseAddr + (15 * 8), flags = gg.TYPE_FLOAT, name = "POS_SALVA_X" },
            { address = baseAddr + (15.5 * 8), flags = gg.TYPE_FLOAT, name = "POS_SALVA_Y" },
            { address = baseAddr + (14.5 * 8), flags = gg.TYPE_FLOAT, name = "POS_SALVA_Z" }
        }

        local vals = gg.getValues(savedPos)
        for i, v in ipairs(vals) do
            savedPos[i].value = v.value
        end

        local list = gg.getListItems()
        for _, item in ipairs(list) do
            if item.name == "POS_SALVA_X" or item.name == "POS_SALVA_Y" or item.name == "POS_SALVA_Z" then
                gg.removeListItems({item})
            end
        end

        gg.addListItems(savedPos)
        gg.toast("✅ Posição salva com sucesso!")
    else
        gg.toast("❌ Erro ao salvar posição")
    end
    
    gg.sleep(1000)
    mainMenu()
end

function teleportToSavedPosition()
    if not savePlayerCoords() then
        return
    end

    local list = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    
    for _, item in ipairs(list) do
        if item.name == "POS_SALVA_X" then
            savedX = item
        elseif item.name == "POS_SALVA_Y" then
            savedY = item
        elseif item.name == "POS_SALVA_Z" then
            savedZ = item
        end
    end

    if not (savedX and savedY and savedZ) then
        gg.toast("❌ Nenhuma posição salva encontrada")
        gg.sleep(1000)
        mainMenu()
        return
    end

    local current = getSavedCoords()
    if not current then
        gg.toast("❌ Erro ao obter coordenadas atuais")
        return
    end

    gg.getValues({savedX, savedY, savedZ})
    current.x.value = savedX.value
    current.y.value = savedY.value
    current.z.value = savedZ.value

    gg.setValues({current.x, current.y, current.z})
    gg.clearResults()
    gg.toast("✅ Teleporte para posição salva realizado!")
    gg.sleep(1000)
    mainMenu()
end

function teleportByCheckpoint()
    if not savePlayerCoords() then
        return
    end

    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("9,44502007e13", gg.TYPE_FLOAT)
    local results = gg.getResults(1000000)

    local filtered = {}
    for _, v in ipairs(results) do
        if string.sub(string.format("%X", v.address), -3) == "278" then
            table.insert(filtered, v)
            break
        end
    end

    if #filtered == 0 then
        gg.toast("❌ Checkpoint não encontrado")
        return
    end

    local baseAddr = filtered[1].address
    local checkpointCoords = {
        { address = baseAddr + (1.5 * 8), flags = gg.TYPE_FLOAT },
        { address = baseAddr + (2 * 8), flags = gg.TYPE_FLOAT },
        { address = baseAddr + (1 * 8), flags = gg.TYPE_FLOAT }
    }

    local values = gg.getValues(checkpointCoords)
    for i, v in ipairs(values) do
        checkpointCoords[i].value = v.value
    end

    local saved = getSavedCoords()
    if not saved then
        gg.toast("❌ Coordenadas do jogador não encontradas")
        return
    end

    saved.x.value = checkpointCoords[1].value
    saved.y.value = checkpointCoords[2].value
    saved.z.value = checkpointCoords[3].value

    gg.setValues({saved.x, saved.y, saved.z})
    gg.clearResults()
    gg.toast("✅ Teleporte realizado para o checkpoint!")
    gg.sleep(1000)
    mainMenu()
end

-- ================= FUNÇÕES DE ARMAS =================
function menuArmas()
    local choice = gg.choice({
        "🔪 Armas Brancas",
        "🔫 Pistolas",
        "🔫 Espingardas",
        "🔫 Submetralhadoras",
        "🔫 Rifles de Assalto",
        "🔫 Fuzis",
        "💣 Armas Pesadas",
        "🚀 Projéteis",
        "🎯 Especiais",
        "🎁 Presentes",
        "🔫 Munição Infinita",
        "🤳 CRIADORES",
        "📱 MINIMIZAR",
        "↩️ Voltar"
    }, nil, "🔫 MENU DE ARMAS")

    if choice == 1 then menuArmasBrancas() 
    elseif choice == 2 then menuPistolas()
    elseif choice == 3 then menuEspingardas()
    elseif choice == 4 then menuSubmetralhadoras()
    elseif choice == 5 then menuRiflesAssalto()
    elseif choice == 6 then menuFuzis()
    elseif choice == 7 then menuArmasPesadas()
    elseif choice == 8 then menuProjeteis()
    elseif choice == 9 then menuEspeciais()
    elseif choice == 10 then menuPresentes()
    elseif choice == 11 then cheatarmas()
    elseif choice == 12 then menuCriadores()
    elseif choice == 13 then minimizar()
    elseif choice == 14 then mainMenu()
    end
end

-- ================= FUNÇÕES DE PUXAR ARMAS =================
function findWeaponBaseAddress()
   gg.clearResults()
   gg.setRanges(gg.REGION_C_ALLOC)
   gg.searchNumber(weaponSettings.searchValue, gg.TYPE_FLOAT)
   
   local results = gg.getResults(1)
   if #results == 0 then
       return nil
   end
   
   if math.abs(results[1].value - weaponSettings.searchValue) > weaponSettings.validationThreshold then
       return nil
   end
   
   return results[1].address
end

function puxarArma(armaConfig)
   if weaponCache.baseAddress == nil then
       local attempts = 0
       
       while attempts < weaponSettings.maxAttempts and weaponCache.baseAddress == nil do
           weaponCache.baseAddress = findWeaponBaseAddress()
           if weaponCache.baseAddress == nil then
               attempts = attempts + 1
               gg.sleep(weaponSettings.searchDelay)
           end
       end

       if weaponCache.baseAddress == nil then
           gg.toast("❌ Falha ao encontrar endereço base da arma")
           return false
       end
   end

   local editValues = {}
   for i, config in ipairs(armaConfig) do
       table.insert(editValues, {
           address = weaponCache.baseAddress + config[2],
           flags = gg.TYPE_DWORD,
           value = config[1]
       })
   end

   gg.setValues(editValues)
   gg.toast("✅ Arma puxada com sucesso!")
   gg.clearResults()
   return true
end

-- ================= MENUS DE ARMAS =================
function menuArmasBrancas()
   local choice = gg.choice({
       "⛳ Taco de Golf",
       "🦯 Cassetete",
       "🔪 Faca",
       "🏏 Taco de Beisebol",
       "🪚 Pá",
       "🎱 Taco de Sinuca",
       "🗡️ Katana",
       "🪚 Serrote",
       "↩️ Voltar"
   }, nil, "🔪 ARMAS BRANCAS")

   if choice == 1 then puxarArma(weapon.tacogolf_w)
   elseif choice == 2 then puxarArma(weapon.cassetete_w)
   elseif choice == 3 then puxarArma(weapon.faca_w)
   elseif choice == 4 then puxarArma(weapon.tacobeisebol_w)
   elseif choice == 5 then puxarArma(weapon.pa_w)
   elseif choice == 6 then puxarArma(weapon.tacosinuca_w)
   elseif choice == 7 then puxarArma(weapon.katana_w)
   elseif choice == 8 then puxarArma(weapon.serrote_w)
   elseif choice == 9 then menuArmas()
   end
end

function menuPistolas()
   local choice = gg.choice({
       "🔫 Colt 45",
       "🔫 Pistola Silenciada",
       "🔫 Desert Eagle",
       "↩️ Voltar"
   }, nil, "🔫 PISTOLAS")

   if choice == 1 then puxarArma(weapon.colt45_w)
   elseif choice == 2 then puxarArma(weapon.silenciada_w)
   elseif choice == 3 then puxarArma(weapon.eagle_w)
   elseif choice == 4 then menuArmas()
   end
end

function menuEspingardas()
   local choice = gg.choice({
       "🔫 Espingarda",
       "🔫 Espingarda Serrada",
       "🔫 Espingarda de Combate",
       "↩️ Voltar"
   }, nil, "🔫 ESPINGARDAS")

   if choice == 1 then puxarArma(weapon.espingarda_w)
   elseif choice == 2 then puxarArma(weapon.espingardacerrada_w)
   elseif choice == 3 then puxarArma(weapon.espingardadcombate_w)
   elseif choice == 4 then menuArmas()
   end
end

function menuSubmetralhadoras()
   local choice = gg.choice({
       "🔫 Uzi",
       "🔫 MP5",
       "🔫 Tec-9",
       "↩️ Voltar"
   }, nil, "🔫 SUBMETRALHADORAS")

   if choice == 1 then puxarArma(weapon.uzi_w)
   elseif choice == 2 then puxarArma(weapon.mp5_w)
   elseif choice == 3 then puxarArma(weapon.tec9_w)
   elseif choice == 4 then menuArmas()
   end
end

function menuRiflesAssalto()
   local choice = gg.choice({
       "🔫 AK-47",
       "🔫 M4",
       "↩️ Voltar"
   }, nil, "🔫 RIFLES DE ASSALTO")

   if choice == 1 then puxarArma(weapon.ak47_w)
   elseif choice == 2 then puxarArma(weapon.m4_w)
   elseif choice == 3 then menuArmas()
   end
end

function menuFuzis()
   local choice = gg.choice({
       "🔫 Rifle",
       "🔫 Rifle de Precisão",
       "↩️ Voltar"
   }, nil, "🔫 FUZIS")

   if choice == 1 then puxarArma(weapon.rifle_w)
   elseif choice == 2 then puxarArma(weapon.sniper_w)
   elseif choice == 3 then menuArmas()
   end
end

function menuArmasPesadas()
   local choice = gg.choice({
       "💣 Lança-Foguetes",
       "🔥 Lança-Chamas",
       "💣 Minigun",
       "↩️ Voltar"
   }, nil, "💣 ARMAS PESADAS")

   if choice == 1 then puxarArma(weapon.rpg_w)
   elseif choice == 2 then puxarArma(weapon.lanca_chamas_w)
   elseif choice == 3 then puxarArma(weapon.minigun_w)
   elseif choice == 4 then menuArmas()
   end
end

function menuProjeteis()
   local choice = gg.choice({
       "💣 Granada",
       "💨 Gás Lacrimogêneo",
       "🔥 Molotov",
       "💣 Carga Explosiva",
       "↩️ Voltar"
   }, nil, "🚀 PROJÉTEIS")

   if choice == 1 then puxarArma(weapon.granada_w)
   elseif choice == 2 then puxarArma(weapon.lacrimogeno_w)
   elseif choice == 3 then puxarArma(weapon.molotov_w)
   elseif choice == 4 then puxarArma(weapon.satchel_w)
   elseif choice == 5 then menuArmas()
   end
end

function menuEspeciais()
   local choice = gg.choice({
       "🎯 Visão Noturna",
       "🎯 Visão Térmica",
       "🪂 Paraquedas",
       "🧴 Spray",
       "🧯 Extintor",
       "📷 Câmera",
       "↩️ Voltar"
   }, nil, "🎯 ESPECIAIS")

   if choice == 1 then puxarArma(weapon.nightvision_w)
   elseif choice == 2 then puxarArma(weapon.thermalvision_w)
   elseif choice == 3 then puxarArma(weapon.paraquedas_w)
   elseif choice == 4 then puxarArma(weapon.spray_w)
   elseif choice == 5 then puxarArma(weapon.extintor_w)
   elseif choice == 6 then puxarArma(weapon.camera_w)
   elseif choice == 7 then menuArmas()
   end
end

function menuPresentes()
   local choice = gg.choice({
       "🎁 Dildo",
       "🎁 Dildo 2",
       "🎁 Vibrador",
       "🌸 Flores",
       "🦯 Bengala",
       "↩️ Voltar"
   }, nil, "🎁 PRESENTES")

   if choice == 1 then puxarArma(weapon.dildo1_w)
   elseif choice == 2 then puxarArma(weapon.dildo2_w)
   elseif choice == 3 then puxarArma(weapon.vibrador_w)
   elseif choice == 4 then puxarArma(weapon.flores_w)
   elseif choice == 5 then puxarArma(weapon.bengala_w)
   elseif choice == 6 then menuArmas()
   end
end

function cheatarmas()
    local weapon = gg.prompt({"Digite a quantidade de munição da arma (Ex: 150)"}, {"0"}, {"number"})
    if weapon == nil then
        gg.toast("Cancelado")
        return
    end

    gg.searchNumber(weapon[1], gg.TYPE_DWORD)
    gg.alert("Gaste uma munição da arma!!")
    gg.toast("Você tem 5 segundos para gastar uma munição")
    gg.sleep(5000)

    local weapon2 = gg.prompt({"Agora digite a quantidade de munição que está após 1 tiro (Ex: 149)"}, {"0"}, {"number"})
    if weapon2 == nil then
        gg.toast("Cancelado")
        return
    end

    gg.refineNumber(weapon2[1], gg.TYPE_DWORD)
    local t = gg.getResults(99999)
    for i, v in ipairs(t) do
        if v.flags == gg.TYPE_DWORD then
            v.value = weapon[1]
            v.freeze = true
        end
    end
    gg.addListItems(t)
    gg.clearResults()
    gg.toast("✅ Munição infinita ativada!")
end

-- ================= INICIALIZAÇÃO =================
gg.toast("🚀 Inicializando Script Guardian Completo...")
gg.toast("🤳 Criado por LZINMODZYTT DANIEL MODZ & LEO MODZ")
savePlayerCoords()
gg.sleep(500)

-- ================= LOOP PRINCIPAL =================
while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        mainMenu()
    end
    gg.sleep(100)
end

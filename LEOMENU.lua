
-- Continue seu script abaixo...
local r = gg.alert(
"╔══════════════════════════════════╗\n" ..
"║     🇧🇷 𝐒𝐂𝐑𝐈𝐏𝐓 𝐋𝐈𝐕𝐄 𝐑𝐔𝐒𝐒𝐈𝐀 🇧🇷     ║\n" ..
"╠══════════════════════════════════╣\n" ..
"║                                  ║\n" ..
"║      🗡️ 𝐂𝐑𝐈𝐀𝐃𝐎 𝐏𝐎𝐑: 🗡️        ║\n" ..
"║     LEO MODZ & DRAGON BR  ║\n" ..
"║                                  ║\n" ..
"╚══════════════════════════════════╝",
"𝐈𝐍𝐈𝐂𝐈𝐀𝐑 ➢",
"𝐒𝐀𝐈𝐑 ⭕"
)

function mainMenu()
gg.setVisible(false)
  local choice = gg.choice({
    " ➢ MENU TELEPORTE🗺",
    " ➢ MENU CARRO🚅 ",
    " ➢ MENU PLAYER👤",
    " ➢ MENU ARMAS🎯 ",
    " ➢ MENU FARM🚜",
    "⭕ SAIR"
  }, nil, "SCRIPT LEO MENU LIVE RUSSIA ")

  if choice == 1 then
    teleport()
  elseif choice == 2 then
    transportMenu()
  elseif choice == 3 then
    PersMenu()
  elseif choice == 4 then
    Gun()
  elseif choice == 5 then
    Bots()
  elseif choice == 6 then
    os.exit()
  end
end

function teleport()
    gg.setVisible(false)
    local choice = gg.choice({
        "🚀 Teletransporte por coordenadas",
        "📍 teleporte qualquer lugar do mapa",
        "💾 Pontos Salvos",
        "🗺 TP MAP",
        "🧾 SALVAR COORDENADAS ANTES DE USAR O TP MAP",
        "🔙 Voltar"
    }, nil, "Escolha uma ação")

    
    if choice == 1 then
        teleportManual()
    elseif choice == 2 then
        selectTeleportCategory()
    elseif choice == 3 then
        userSavedPointsMenu()
    elseif choice == 4 then
        searchAndReplaceCoords()
    elseif choice == 5 then
        TeleportPoMet()
    elseif choice == 6 then
        mainMenu()
    else
        gg.toast("Nada selecionado")
        mainMenu()
    end
end

function transportMenu()
    local choice = gg.choice({
        "🚀 Teletransporte com Transporte",
        "🚗 Gamemode cara",
        "💥 Explodir o transporte",
        "🚀 Teletransporte com Transporte",
        "🤸 Golpe de transporte", 
        "🏎️ Aumento de velocidade",
        "🛵 Patinete rápida",
        "🔙 Voltar"
    }, nil, "Transporte")

    if choice == 1 then
        teleportCar()
    elseif choice == 2 then
        toggleFreezeCarHP()
    elseif choice == 3 then
        toggleBax()
    elseif choice == 4 then
        flip()
    elseif choice == 5 then
        speedcars()
    elseif choice == 6 then
        FastScooterToggle()
    elseif choice == 7 or choice == nil then
        mainMenu()
    end
end

function PersMenu()
    gg.setVisible(false)
    local choice = gg.choice({
        "🔬Hitboxes aumentados",
        "🏃 Corrida rápida",
        "👟 Corrida Infinita",
        "📷 koi Fov",
        "👁️‍🗨️ Etiquetas de nome",
        "🌧️ Chuva",
        "〽️ Mudar apelido",
        "♥️ vida infinita",
        "🪖 colete infinito",
        "🚄 SpeedHack",
        "🌳 Vegetação",
        "👁️ melhora gráfico",
        "🐢 Speed Agachado",
        "📱 Tela Esticada",
        "🦘 Super Pulo",
        "🔙 Voltar"
    }, nil, "Personagem")

    if choice == 1 then
        searchAndChangeHitboxes()
    elseif choice == 2 then
        toggleSprint()
    elseif choice == 3 then
        Sprint()
    elseif choice == 4 then
        toggleFov()
    elseif choice == 5 then
        nameTags()
    elseif choice == 6 then
        toggleRain()
    elseif choice == 7 then
        changeNik()
    elseif choice == 8 then
        Gm_pers()
    elseif choice == 9 then
        Gm_armor()
    elseif choice == 10 then
        SpeedHack()
    elseif choice == 11 then
        menuVegetacao()
    elseif choice == 12 then
        menuLightMap()
    elseif choice == 13 then
        menuSpeedAgachado()
    elseif choice == 14 then
        menuTelaEsticada()
    elseif choice == 15 then
        menuSuperPulo()
    elseif choice == 16 or choice == nil then
        mainMenu()
    end
end

function Bots()
        local subMenu = gg.choice({
            "🚖 FARME TAXI",
            "🏎️ FARME CORRIDA", 
            "✈️ FARME AVIÃO",
            "🛢️ FARME DE SERRARIA",
            "⚒️ MENU FARME",
            "🪵 FARME LENHADOR",
            "🏭 FARME FÁBRICA DE MÓVEIS",
            "⬅ Voltar"
        }, nil, "Menu: Farme")

        if subMenu == 1 then
            botTaxi()
        elseif subMenu == 2 then
            cycleCheckpoints()
        elseif subMenu == 3 then
            botAir()
        elseif subMenu == 4 then
            bot_Neftezavod()
        elseif subMenu == 5 then
            bot_main()
        elseif subMenu == 6 then
            bot_forest()
        elseif subMenu == 7 then
            bot_factory()
        elseif subMenu == 8 then
            mainMenu()
        end
    end

local recoilActive = false

function Gun()
    gg.setVisible(false)
    local choice = gg.choice({
        "🔫 PUXAR ARMA",
        "🎯 Anti-dispersão",
        "💥 Deslocamento de visão",
        "☄️ Anti sobrecarga",
        "🔙 Voltar"
    }, nil, "Escolha uma ação")

    if choice == 1 then
        Gun1()
    elseif choice == 2 then
        toggleRecoil()
    elseif choice == 3 then
        Smeh()
    elseif choice == 4 then
        Gm_weapons()
    elseif choice == 5 or choice == nil then
        mainMenu()
    end
end

local active = false
local savedAddr = nil
local savedValue = nil
local selectedSpeed = 3 -- valor padrão

-- ==================== NOVAS FUNÇÕES (Vegetação, Light Map, Speed Agachado, Tela Esticada, Super Pulo) ====================

-- Cache para as funções
local vegetacaoCache   = { addresses = nil, lastTarget = '223.27423095703' }
local lightMapCache    = { addresses = nil, lastTarget = '974.40002441406' }
local speedAgachadoCache = { addresses = nil, lastTarget = '974.40002441406' }
local superPuloCache   = { addresses = nil, lastTarget = "4.15768349e21" }

-- Executa uma função com proteção contra erros
function executarComProtecao(fn, nome)
    local ok, err = pcall(fn)
    if not ok then
        gg.toast('❌ Erro em ' .. nome .. ': ' .. tostring(err))
    end
end

-- ==================== VEGETAÇÃO ====================
function vegetacaoAplicar(valor)
    if not vegetacaoCache.addresses then
        gg.clearResults()
        gg.searchNumber(vegetacaoCache.lastTarget, gg.TYPE_FLOAT)
        local res = gg.getResults(5000)
        if #res == 0 then gg.toast('❌ Vegetação não encontrada'); return end
        vegetacaoCache.addresses = {}
        for i, v in ipairs(res) do vegetacaoCache.addresses[i] = v.address + 32 end
    end
    local edits = {}
    for i, addr in ipairs(vegetacaoCache.addresses) do
        edits[i] = { address = addr, flags = gg.TYPE_FLOAT, value = valor }
    end
    gg.setValues(edits)
    gg.toast(valor == 1.0 and '🌳 Vegetação DESATIVADA' or '🌿 Vegetação ATIVADA')
    gg.clearResults()
end

function menuVegetacao()
    while true do
        local opcao = gg.choice({
            '❌ Desativar (remover plantas)',
            '✅ Ativar (padrão)',
            '🔙 Voltar'
        }, nil, '🌳 VEGETAÇÃO')
        if not opcao or opcao == 3 then break end
        executarComProtecao(function()
            if opcao == 1 then vegetacaoAplicar(1.0)
            elseif opcao == 2 then vegetacaoAplicar(0.2) end
        end, 'Vegetação')
    end
end

-- ==================== LIGHT MAP ====================
function lightMapAplicar(valor)
    if not lightMapCache.addresses then
        gg.clearResults()
        gg.searchNumber(lightMapCache.lastTarget, gg.TYPE_FLOAT)
        local res = gg.getResults(5000)
        if #res == 0 then gg.toast('❌ Light Map não encontrado'); return end
        lightMapCache.addresses = {}
        for i, v in ipairs(res) do lightMapCache.addresses[i] = v.address + 64 end
    end
    local edits = {}
    for i, addr in ipairs(lightMapCache.addresses) do
        edits[i] = { address = addr, flags = gg.TYPE_FLOAT, value = valor }
    end
    gg.setValues(edits)
    gg.toast(valor == 1.0 and '👁️ Light Map ATIVADO' or '🌙 Light Map DESATIVADO')
    gg.clearResults()
end

function menuLightMap()
    while true do
        local opcao = gg.choice({
            '✅ Ativar (claro)',
            '❌ Desativar (escuro)',
            '🔙 Voltar'
        }, nil, '👁️ LIGHT MAP')
        if not opcao or opcao == 3 then break end
        executarComProtecao(function()
            if opcao == 1 then lightMapAplicar(1.0)
            elseif opcao == 2 then lightMapAplicar(0.20000000298) end
        end, 'Light Map')
    end
end

-- ==================== SPEED AGACHADO ====================
function speedAgachadoAplicar(valor)
    if not speedAgachadoCache.addresses then
        gg.clearResults()
        gg.searchNumber(speedAgachadoCache.lastTarget, gg.TYPE_FLOAT)
        local res = gg.getResults(5000)
        if #res == 0 then gg.toast('❌ Speed Agachado não encontrado'); return end
        speedAgachadoCache.addresses = {}
        for i, v in ipairs(res) do speedAgachadoCache.addresses[i] = v.address - 72 end
    end
    local edits = {}
    for i, addr in ipairs(speedAgachadoCache.addresses) do
        edits[i] = { address = addr, flags = gg.TYPE_FLOAT, value = valor }
    end
    gg.setValues(edits)
    gg.toast(string.format('🐢 Speed Agachado: %.1fx', valor))
    gg.clearResults()
end

function menuSpeedAgachado()
    while true do
        local opcao = gg.choice({
            '🧎 2x',
            '🧎 4x',
            '🧎 6x',
            '🧎 8x',
            '🚶 Normal (1x)',
            '🔙 Voltar'
        }, nil, '🐢 SPEED AGACHADO')
        if not opcao or opcao == 6 then break end
        executarComProtecao(function()
            if opcao == 1 then speedAgachadoAplicar(2.0)
            elseif opcao == 2 then speedAgachadoAplicar(4.0)
            elseif opcao == 3 then speedAgachadoAplicar(6.0)
            elseif opcao == 4 then speedAgachadoAplicar(8.0)
            elseif opcao == 5 then speedAgachadoAplicar(1.0) end
        end, 'Speed Agachado')
    end
end

-- ==================== TELA ESTICADA ====================
function telaEsticadaAtivar()
    gg.searchNumber('70', gg.TYPE_FLOAT)
    gg.getResults(99999)
    gg.editAll('120', gg.TYPE_FLOAT)
    gg.toast('📱 Tela esticada ATIVADA')
    gg.clearResults()
end

function telaEsticadaDesativar()
    gg.searchNumber('120', gg.TYPE_FLOAT)
    gg.getResults(99999)
    gg.editAll('70', gg.TYPE_FLOAT)
    gg.toast('📱 Tela esticada DESATIVADA')
    gg.clearResults()
end

function menuTelaEsticada()
    while true do
        local opcao = gg.choice({
            '✅ Ativar',
            '❌ Desativar',
            '🔙 Voltar'
        }, nil, '📱 TELA ESTICADA')
        if not opcao or opcao == 3 then break end
        executarComProtecao(function()
            if opcao == 1 then telaEsticadaAtivar()
            elseif opcao == 2 then telaEsticadaDesativar() end
        end, 'Tela Esticada')
    end
end

-- ==================== SUPER PULO ====================
function ativarSuperPulo2(valordosuperpulo)
    if type(valordosuperpulo) ~= "number" or valordosuperpulo <= 0 then
        gg.toast("⚠️ Valor inválido! Use um número positivo")
        return false
    end

    if superPuloCache.addresses then
        local edits = {}
        for i, addr in ipairs(superPuloCache.addresses) do
            edits[i] = {
                address = addr,
                flags = gg.TYPE_FLOAT,
                value = valordosuperpulo
            }
        end
        gg.setValues(edits)
        gg.toast(string.format("🦘 Super Pulo: %.1f", valordosuperpulo))
        gg.clearResults()
        return true
    end

    gg.clearResults()
    gg.searchNumber(superPuloCache.lastTarget, gg.TYPE_FLOAT)
    
    local results = gg.getResults(5000)
    if #results == 0 then
        gg.toast("❌ Valor base não encontrado!")
        return false
    end

    superPuloCache.addresses = {}
    for i, result in ipairs(results) do
        superPuloCache.addresses[i] = result.address - 36
    end

    local edits = {}
    for i, addr in ipairs(superPuloCache.addresses) do
        edits[i] = {
            address = addr,
            flags = gg.TYPE_FLOAT,
            value = valordosuperpulo
        }
    end
    gg.setValues(edits)
    gg.toast(string.format("🦘 Super Pulo %.1f ativado", valordosuperpulo))
    gg.clearResults()
    return true
end

function desativarSuperPulo2()
    local defaultJumpValue = 0.8

    if superPuloCache.addresses then
        local edits = {}
        for i, addr in ipairs(superPuloCache.addresses) do
            edits[i] = {
                address = addr,
                flags = gg.TYPE_FLOAT,
                value = defaultJumpValue
            }
        end
        gg.setValues(edits)
        gg.toast("🦘 Super Pulo DESATIVADO")
        gg.clearResults()
        return true
    end

    gg.clearResults()
    gg.searchNumber(superPuloCache.lastTarget, gg.TYPE_FLOAT)
    
    local results = gg.getResults(5000)
    if #results == 0 then
        gg.toast("❌ Valor base não encontrado!")
        return false
    end

    superPuloCache.addresses = {}
    for i, result in ipairs(results) do
        superPuloCache.addresses[i] = result.address - 36
    end

    local edits = {}
    for i, addr in ipairs(superPuloCache.addresses) do
        edits[i] = {
            address = addr,
            flags = gg.TYPE_FLOAT,
            value = defaultJumpValue
        }
    end
    gg.setValues(edits)
    gg.toast("🦘 Super Pulo DESATIVADO")
    gg.clearResults()
    return true
end

function menuSuperPulo()
    while true do
        local escolha = gg.choice({
            "🦘 SUPER PULO 2X",
            "🦘 SUPER PULO 4X",
            "🦘 SUPER PULO 6X",
            "🦘 SUPER PULO 8X",
            "❌ Desativar Super Pulo",
            "🔙 Voltar"
        }, nil, "🚀 SUPER PULO - GUARDIAN")
        
        if not escolha then break end
        if escolha == 1 then
            ativarSuperPulo2(2.5641089)
        elseif escolha == 2 then
            ativarSuperPulo2(4.5641089)
        elseif escolha == 3 then
            ativarSuperPulo2(6.5641089)
        elseif escolha == 4 then
            ativarSuperPulo2(8.5641089)
        elseif escolha == 5 then
            desativarSuperPulo2()
        elseif escolha == 6 then
            break
        end
    end
end

-- ==================== PRÉ-CARREGAMENTO DOS ENDEREÇOS ====================
function carregarTudo()
    gg.toast("⏳ Pré-carregando endereços...")

    -- Vegetação
    gg.clearResults()
    gg.searchNumber(vegetacaoCache.lastTarget, gg.TYPE_FLOAT)
    local res = gg.getResults(5000)
    if #res > 0 then
        vegetacaoCache.addresses = {}
        for i, v in ipairs(res) do vegetacaoCache.addresses[i] = v.address + 32 end
    end

    -- Light Map
    gg.clearResults()
    gg.searchNumber(lightMapCache.lastTarget, gg.TYPE_FLOAT)
    res = gg.getResults(5000)
    if #res > 0 then
        lightMapCache.addresses = {}
        for i, v in ipairs(res) do lightMapCache.addresses[i] = v.address + 64 end
    end

    -- Speed Agachado
    gg.clearResults()
    gg.searchNumber(speedAgachadoCache.lastTarget, gg.TYPE_FLOAT)
    res = gg.getResults(5000)
    if #res > 0 then
        speedAgachadoCache.addresses = {}
        for i, v in ipairs(res) do speedAgachadoCache.addresses[i] = v.address - 72 end
    end

    -- Super Pulo
    gg.clearResults()
    gg.searchNumber(superPuloCache.lastTarget, gg.TYPE_FLOAT)
    res = gg.getResults(5000)
    if #res > 0 then
        superPuloCache.addresses = {}
        for i, v in ipairs(res) do superPuloCache.addresses[i] = v.address - 36 end
    end

    gg.clearResults()
    gg.toast("✅ Endereços carregados! Clique no ícone do GG.")
end

-- ==================== FIM DAS NOVAS FUNÇÕES ====================

function chooseSpeedSlider()
    local input = gg.prompt(
        {"Escolha a velocidade:"},
        {selectedSpeed},
        {"number"}
    )

    if input then
        selectedSpeed = tonumber(input[1])
    end
end


function SpeedHack()
    gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP)

    if not active then
        chooseSpeedSlider()

        gg.searchNumber("9187343240761165228", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
        local results = gg.getResults(1)

        if #results == 0 then
            gg.alert("❌ Valor não encontrado.")
            return
        end

        savedAddr = results[1].address
        savedValue = gg.getValues({{address = savedAddr, flags = gg.TYPE_QWORD}})[1].value

        local t = {}
        t[1] = {address = savedAddr, flags = gg.TYPE_FLOAT, value = selectedSpeed}
        gg.setValues(t)

        active = true
        gg.toast("🚀 SpeedHack ativado | x" .. selectedSpeed)

    else
        if savedAddr ~= nil and savedValue ~= nil then
            local restore = {}
            restore[1] = {address = savedAddr, flags = gg.TYPE_QWORD, value = savedValue}
            gg.setValues(restore)
            gg.toast("⛔ SpeedHack desativado")
        end
        active = false
    end
end

function Sprint()
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)

    gg.searchNumber("281474993487972", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
    local r = gg.getResults(30)
    local t = {}

    if #r == 0 then
        gg.alert("❌ Valor não encontrado.")
    else
        for i, v in ipairs(r) do
            t[i] = {
                address = v.address - 0x160,
                flags = gg.TYPE_FLOAT,
                value = 450,
                freeze = true
            }
        end
        gg.setValues(t)
        gg.addListItems(t)
        gg.toast("✅ Ativado")
    end
end

function speedcars()
    gg.clearResults()

    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("4812096201845506048", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)

    local r = gg.getResults(100)
    if #r == 0 then
        gg.alert("❌ Valor não encontrado")
        return
    end

    local t = {}
    for i, v in ipairs(r) do
        t[#t + 1] = {
            address = v.address + 0x64,
            flags = gg.TYPE_FLOAT,
            value = -0.00179999997,
            freeze = true
        }
    end

    gg.setValues(t)
    gg.addListItems(t)
    gg.toast("✅ Ativado!")
end

function flip()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("4812096201845506048", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
    local results = gg.getResults(100)

    if #results == 0 then
        gg.alert("❌ Valor não encontrado")
        return
    end

    local edits = {}
    for i, v in ipairs(results) do
        for j = 0, 2 do
            table.insert(edits, {
                address = v.address + 0x20 + j * 0x4,
                flags = gg.TYPE_FLOAT,
                value = -0.1
            })
        end
    end

    gg.setValues(edits)
    gg.toast("✅ Ativado")
end

local modifiedValues = {}

function searchAndReplaceFloat(target, newValue)
    gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber(target, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    local results = gg.getResults(100)
    
    if #results == 0 then
        gg.toast("❌ Valor não encontrado")
        return
    end

    for i, v in ipairs(results) do
        modifiedValues[v.address] = {
            address = v.address,
            flags = v.flags,
            value = target
        }
        v.value = newValue
    end

    gg.setValues(results)
    gg.toast("✅ Sucesso")
    gg.clearResults()
end

function restoreOriginalValues()
    if next(modifiedValues) == nil then
        return
    end

    local restoreList = {}
    for _, v in pairs(modifiedValues) do
        table.insert(restoreList, v)
    end

    gg.setValues(restoreList)
    gg.toast("✅ Sucesso")
    modifiedValues = {}
end


function Gm_armor()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("99999.99", gg.TYPE_FLOAT)
    local results = gg.getResults(1)

    if #results == 0 then
        gg.alert("❌ Valor não encontrado.")
        return
    end
    local targetAddr = results[1].address - (9.5 * 8)
    local edit = {
        address = targetAddr,
        flags = gg.TYPE_FLOAT,
        value = 3276887
    }

    gg.setValues({edit})
    edit.freeze = true
    gg.addListItems({edit})

    gg.toast("✅ Gamemode ativado.")
end

function Gm_pers()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("99999.99", gg.TYPE_FLOAT)
    local results = gg.getResults(1)

    if #results == 0 then
        gg.alert("❌ Valor não encontrado.")
        return
    end
    local targetAddr = results[1].address - (10.5 * 8)
    local edit = {
        address = targetAddr,
        flags = gg.TYPE_FLOAT,
        value = 3276887
    }

    gg.setValues({edit})
    edit.freeze = true
    gg.addListItems({edit})

    gg.toast("✅ Gamemode ativado.")
end

function Smeh()
    local choice = gg.choice({
        "⬅️ Deslocar para a esquerda",
        "➡️ Deslocar para a direita",
        "🧮 Deslocamento próprio",
        "↩️ Reversão",
        "🔙 Voltar"
    }, nil, "Menu de deslocamento")

    if choice == 1 then
        searchAndReplaceFloat("0.20000000298", -1)
    elseif choice == 2 then
        searchAndReplaceFloat("0.20000000298", 1)
    elseif choice == 3 then
        local input = gg.prompt({"Digite seu valor de deslocamento:"}, nil, {"number"})
        if input and input[1] then
            local num = tonumber(input[1])
            if num then
                searchAndReplaceFloat("0.20000000298", num)
            else
                gg.toast("❌ Valor não é um número")
            end
        else
            gg.toast("❌ Entrada cancelada")
        end
    elseif choice == 4 then
        restoreOriginalValues()
        gg.clearResults()
    end
end

function Gm_weapons()
    gg.setVisible(false)
    local choice = gg.choice({
        "🔫 AK-47",
        "💥 Desert Eagle",
        "🔧 M4",
        "⚙️ MP5",
        "🧨 Shotgun",
        "🔙 Voltar"
    }, nil, "Escolha uma arma:")

    if choice == 1 then
        Gm_weapon("AK-47", 27, 27.5)
    elseif choice == 2 then
        Gm_weapon("Desert Eagle", 15, 15.5)
    elseif choice == 3 then
        Gm_weapon("M4", 27, 27.5)
    elseif choice == 4 then
        Gm_weapon("MP5", 23,5, 23)
    elseif choice == 5 then
        Gm_weapon("Shotgun", 19, 19.5)
    elseif choice == 6 then
        Gun()
    end
end

function Gm_weapon(name, offset_main, offset_ref)
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("99999.99", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
    local results = gg.getResults(1)
    local baseAddr = results[1].address
    local targetAddr = baseAddr + (offset_main * 8)
    local refAddr = baseAddr + (offset_ref * 8)
    local refValue = gg.getValues({{address = refAddr, flags = gg.TYPE_DWORD}})[1].value
    gg.setValues({{address = targetAddr, flags = gg.TYPE_DWORD, value = refValue}})
    gg.addListItems({{address = targetAddr, flags = gg.TYPE_DWORD, freeze = true}})

    gg.toast("✅ Ativado")
end

function toggleRecoil()
    if not recoilActive then
        gunn()
        recoilActive = true
    else
        gunn2()
        recoilActive = false
    end
end

function gunn() 
    gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("100;900", gg.TYPE_FLOAT)
    gg.refineNumber("100", gg.TYPE_FLOAT)
    revert = gg.getResults(400)
    gg.editAll("95", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("🌀 Anti-spread ativado 🌀")
end 

function gunn2() 
    gg.clearResults()
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("95;900", gg.TYPE_FLOAT)
    gg.refineNumber("95", gg.TYPE_FLOAT)
    revert = gg.getResults(555)
    gg.editAll("100", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("🌀 Anti-spread desativado 🌀")
end

function Gun1()
    gg.setVisible(false)
    local menu = gg.choice({
        "▶ Selecione: soco inglês",
        "▶ Selecione: Taco de Hóquei",
        "▶ Selecione: bastão",
        "▶ Selecione: faca",                
        "▶ Selecione: bit",        
        "▶ Selecione: pá",      
        "▶ Selecione: bastão",     
        "▶ Selecione: katana",       
        "▶ Selecione: serra",        
        "▶ Selecione: vibrador",        
        "▶ Selecione: dildo2",        
        "▶ Selecione: vibrador",        
        "▶ Selecione: vibrador2",        
        "▶ Selecione: flores",        
        "▶ Selecione: bengala",        
        "▶ Selecione: granada",        
        "▶ Selecione: gás",        
        "▶ Selecione: Molotov",        
        "▶ Selecione: Colt45",        
        "▶ Selecione: chocante",        
        "▶ Selecione: deagle",        
        "▶ Selecione: espingarda",        
        "▶ Selecione: cortar",        
        "▶ Selecione: salvo",        
        "▶ Selecione: ultrassom",        
        "▶ Selecione: mp5",        
        "▶ Selecione: акр47",        
        "▶ Selecione: м4",       
        "▶ Selecione: tek9",        
        "▶ Selecione: rifle",        
        "▶ Selecione: rifle de precisão",        
        "▶ Selecione: Lançador de Granadas",       
        "▶ Selecione: pistola de sinalização",       
        "▶ Selecione: Lança-chamas",        
        "▶ Selecione: minigun",        
        "▶ Selecione: Velcro",        
        "▶ Selecione: ativador",        
        "▶ Selecione: spray",        
        "▶ Selecione: extintor de incêndio",        
        "▶ Selecione: câmera",        
        "▶ Selecione: câmera termográfica",        
        "▶ Selecione: câmera térmica2",        
        "▶ Selecione: paraquedas",        
        "❌ Sair"
    }, nil, "Selecione uma arma:")

    if menu == 1 then
        applyWeapon("WEAPON_BRASSKNUCKLE")
    elseif menu == 2 then
        applyWeapon("WEAPON_GOLFCLUB")
    elseif menu == 3 then
        applyWeapon("WEAPON_NITESTICK")
    elseif menu == 4 then
        applyWeapon("WEAPON_KNIFE")
    elseif menu == 5 then
        applyWeapon("WEAPON_BAT")
    elseif menu == 6 then
        applyWeapon("WEAPON_SHOVEL")
    elseif menu == 7 then
        applyWeapon("WEAPON_POOLSTICK")
    elseif menu == 8 then
        applyWeapon("WEAPON_KATANA")
    elseif menu == 9 then
        applyWeapon("WEAPON_CHAINSAW")
    elseif menu == 10 then
        applyWeapon("WEAPON_DILDO")
    elseif menu == 11 then
        applyWeapon("WEAPON_DILDO2")
    elseif menu == 12 then
        applyWeapon("WEAPON_VIBRATOR")
    elseif menu == 13 then
        applyWeapon("WEAPON_VIBRATOR2")
    elseif menu == 14 then
        applyWeapon("WEAPON_FLOWER")
    elseif menu == 15 then
        applyWeapon("WEAPON_CANE")
    elseif menu == 16 then
        applyWeapon("WEAPON_GRENADE")
    elseif menu == 17 then
        applyWeapon("WEAPON_TEARGAS")
    elseif menu == 18 then
        applyWeapon("WEAPON_MOLOTOV")
    elseif menu == 19 then
        applyWeapon("WEAPON_COLT45")
    elseif menu == 20 then
        applyWeapon("WEAPON_SILENCED")
    elseif menu == 21 then
        applyWeapon("WEAPON_DEAGLE")
    elseif menu == 22 then
        applyWeapon("WEAPON_SHOTGUN")
    elseif menu == 23 then
        applyWeapon("WEAPON_SAWEDOFF")
    elseif menu == 24 then
        applyWeapon("WEAPON_SHOTGSPA")
    elseif menu == 25 then
        applyWeapon("WEAPON_UZI")
    elseif menu == 26 then
        applyWeapon("WEAPON_MP5")
    elseif menu == 27 then
        applyWeapon("WEAPON_AK47")
    elseif menu == 28 then
        applyWeapon("WEAPON_M4")
    elseif menu == 29 then
        applyWeapon("WEAPON_TEC9")
    elseif menu == 30 then
        applyWeapon("WEAPON_RIFLE")
    elseif menu == 31 then
        applyWeapon("WEAPON_SNIPER")
    elseif menu == 32 then
        applyWeapon("WEAPON_ROCKETLAUNCHER")
    elseif menu == 33 then
        applyWeapon("WEAPON_HEATSEEKER")
    elseif menu == 34 then
        applyWeapon("WEAPON_FLAMETHROWER")
    elseif menu == 35 then
        applyWeapon("WEAPON_MINIGUN")
    elseif menu == 36 then
        applyWeapon("WEAPON_SATCHEL")
    elseif menu == 37 then
        applyWeapon("WEAPON_BOMB")
    elseif menu == 38 then
        applyWeapon("WEAPON_SPRAYCAN")
    elseif menu == 39 then
        applyWeapon("WEAPON_FIREEXTINGUISHER")
    elseif menu == 40 then
        applyWeapon("WEAPON_CAMERA")
    elseif menu == 41 then
        applyWeapon("TEPLOWIZER")
    elseif menu == 42 then
        applyWeapon("TEPLOWIZER2")
    elseif menu == 43 then
        applyWeapon("WEAPON_PARACHUTE")
    elseif menu == 44 then
        mainMenu()
    end
end

function applyWeapon(type)
    gg.setVisible(false)
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("99999.99", gg.TYPE_FLOAT)
    local results = gg.getResults(1)

    if #results == 0 then
    end

    local baseAddr = results[1].address
    local offsets = {}

    if type == "WEAPON_BRASSKNUCKLE" then
        offsets = {
            {address = baseAddr + (7.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (6 * 8), flags = gg.TYPE_DWORD, value = 1}
        }
    elseif type == "WEAPON_GOLFCLUB" then
        offsets = {
            {address = baseAddr + (7.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (6 * 8), flags = gg.TYPE_DWORD, value = 2}
        }
    elseif type == "WEAPON_NITESTICK" then
        offsets = {
            {address = baseAddr + (11.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (10 * 8), flags = gg.TYPE_DWORD, value = 3}
        }
    elseif type == "WEAPON_KNIFE" then
        offsets = {
            {address = baseAddr + (11.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (10 * 8), flags = gg.TYPE_DWORD, value = 4}
        }
    elseif type == "WEAPON_BAT" then
        offsets = {
            {address = baseAddr + (11.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (10 * 8), flags = gg.TYPE_DWORD, value = 5}
        }
    elseif type == "WEAPON_SHOVEL" then
        offsets = {
            {address = baseAddr + (11.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (10 * 8), flags = gg.TYPE_DWORD, value = 6}
        }
    elseif type == "WEAPON_POOLSTICK" then
        offsets = {
            {address = baseAddr + (11.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (10 * 8), flags = gg.TYPE_DWORD, value = 7}
        }
    elseif type == "WEAPON_KATANA" then
        offsets = {
            {address = baseAddr + (11.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (10 * 8), flags = gg.TYPE_DWORD, value = 8}
        }
    elseif type == "WEAPON_CHAINSAW" then
        offsets = {
            {address = baseAddr + (11.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (10 * 8), flags = gg.TYPE_DWORD, value = 9}
        }
    elseif type == "WEAPON_DILDO" then
        offsets = {
            {address = baseAddr + (47.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (46 * 8), flags = gg.TYPE_DWORD, value = 10}
        }
    elseif type == "WEAPON_DILDO2" then
        offsets = {
            {address = baseAddr + (47.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (46 * 8), flags = gg.TYPE_DWORD, value = 11}
        }
    elseif type == "WEAPON_VIBRATOR" then
        offsets = {
            {address = baseAddr + (47.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (46 * 8), flags = gg.TYPE_DWORD, value = 12}
        }
    elseif type == "WEAPON_VIBRATOR2" then
        offsets = {
            {address = baseAddr + (47.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (46 * 8), flags = gg.TYPE_DWORD, value = 13}
        }
    elseif type == "WEAPON_FLOWER" then
        offsets = {
            {address = baseAddr + (47.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (46 * 8), flags = gg.TYPE_DWORD, value = 14}
        }
    elseif type == "WEAPON_CANE" then
        offsets = {
            {address = baseAddr + (47.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (46 * 8), flags = gg.TYPE_DWORD, value = 15}
        }
    elseif type == "WEAPON_GRENADE" then
        offsets = {
            {address = baseAddr + (39.5 * 8), flags = gg.TYPE_DWORD, value = 5},
            {address = baseAddr + (38 * 8), flags = gg.TYPE_DWORD, value = 16}
        }
    elseif type == "WEAPON_TEARGAS" then
        offsets = {
            {address = baseAddr + (39.5 * 8), flags = gg.TYPE_DWORD, value = 5},
            {address = baseAddr + (38 * 8), flags = gg.TYPE_DWORD, value = 17}
        }
    elseif type == "WEAPON_MOLOTOV" then
        offsets = {
            {address = baseAddr + (39.5 * 8), flags = gg.TYPE_DWORD, value = 5},
            {address = baseAddr + (38 * 8), flags = gg.TYPE_DWORD, value = 18}
        }
    elseif type == "WEAPON_COLT45" then
        offsets = {
            {address = baseAddr + (15.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (14 * 8), flags = gg.TYPE_DWORD, value = 22}
        }
    elseif type == "WEAPON_SILENCED" then
        offsets = {
            {address = baseAddr + (15.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (14 * 8), flags = gg.TYPE_DWORD, value = 23}
        }
    elseif type == "WEAPON_DEAGLE" then
        offsets = {
            {address = baseAddr + (15.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (14 * 8), flags = gg.TYPE_DWORD, value = 24}
        }
    elseif type == "WEAPON_SHOTGUN" then
        offsets = {
            {address = baseAddr + (19.5 * 8), flags = gg.TYPE_DWORD, value = 26},
            {address = baseAddr + (18 * 8), flags = gg.TYPE_DWORD, value = 25}
        }
    elseif type == "WEAPON_SAWEDOFF" then
        offsets = {
            {address = baseAddr + (19.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (18 * 8), flags = gg.TYPE_DWORD, value = 26}
        }
    elseif type == "WEAPON_SHOTGSPA" then
        offsets = {
            {address = baseAddr + (19.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (18 * 8), flags = gg.TYPE_DWORD, value = 27}
        }
    elseif type == "WEAPON_UZI" then
        offsets = {
            {address = baseAddr + (23.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (22 * 8), flags = gg.TYPE_DWORD, value = 28}
        }
    elseif type == "WEAPON_MP5" then
        offsets = {
            {address = baseAddr + (23.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (22 * 8), flags = gg.TYPE_DWORD, value = 29}
        }
    elseif type == "WEAPON_AK47" then
        offsets = {
            {address = baseAddr + (27.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (26 * 8), flags = gg.TYPE_DWORD, value = 30}
        }
    elseif type == "WEAPON_M4" then
        offsets = {
            {address = baseAddr + (27.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (26 * 8), flags = gg.TYPE_DWORD, value = 31}
        }
    elseif type == "WEAPON_TEC9" then
        offsets = {
            {address = baseAddr + (23.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (22 * 8), flags = gg.TYPE_DWORD, value = 32}
        }
    elseif type == "WEAPON_RIFLE" then
        offsets = {
            {address = baseAddr + (31.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (30 * 8), flags = gg.TYPE_DWORD, value = 33}
        }
    elseif type == "WEAPON_SNIPER" then
        offsets = {
            {address = baseAddr + (31.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (30 * 8), flags = gg.TYPE_DWORD, value = 34}
        }
    elseif type == "WEAPON_ROCKETLAUNCHER" then
        offsets = {
            {address = baseAddr + (35.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (34 * 8), flags = gg.TYPE_DWORD, value = 35}
        }
    elseif type == "WEAPON_HEATSEEKER" then
        offsets = {
            {address = baseAddr + (35.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (34 * 8), flags = gg.TYPE_DWORD, value = 36}
        }
    elseif type == "WEAPON_FLAMETHROWER" then
        offsets = {
            {address = baseAddr + (35.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (34 * 8), flags = gg.TYPE_DWORD, value = 37}
        }
    elseif type == "WEAPON_MINIGUN" then
        offsets = {
            {address = baseAddr + (35.5 * 8), flags = gg.TYPE_DWORD, value = 20},
            {address = baseAddr + (34 * 8), flags = gg.TYPE_DWORD, value = 38}
        }
    elseif type == "WEAPON_SATCHEL" then
        offsets = {
            {address = baseAddr + (39.5 * 8), flags = gg.TYPE_DWORD, value = 5},
            {address = baseAddr + (38 * 8), flags = gg.TYPE_DWORD, value = 39}
        }
    elseif type == "WEAPON_BOMB" then
        offsets = {
            {address = baseAddr + (54.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (53 * 8), flags = gg.TYPE_DWORD, value = 40}
        }
    elseif type == "WEAPON_SPRAYCAN" then
        offsets = {
            {address = baseAddr + (43.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (42 * 8), flags = gg.TYPE_DWORD, value = 41}
        }
    elseif type == "WEAPON_FIREEXTINGUISHER" then
        offsets = {
            {address = baseAddr + (54.5 * 8), flags = gg.TYPE_DWORD, value = 25},
            {address = baseAddr + (53 * 8), flags = gg.TYPE_DWORD, value = 42}
        }
    elseif type == "WEAPON_CAMERA" then
        offsets = {
            {address = baseAddr + (43.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (42 * 8), flags = gg.TYPE_DWORD, value = 43}
        }
    elseif type == "TEPLOWIZER" then
        offsets = {
            {address = baseAddr + (51.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (50 * 8), flags = gg.TYPE_DWORD, value = 44}
        }
    elseif type == "TEPLOWIZER2" then
        offsets = {
            {address = baseAddr + (51.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (50 * 8), flags = gg.TYPE_DWORD, value = 45}
        }
    elseif type == "WEAPON_PARACHUTE" then
        offsets = {
            {address = baseAddr + (51.5 * 8), flags = gg.TYPE_DWORD, value = 1},
            {address = baseAddr + (50 * 8), flags = gg.TYPE_DWORD, value = 46}
        }
    end
local weaponNames = {
    WEAPON_BRASSKNUCKLE = "Soco inglês",
    WEAPON_GOLFCLUB = "Taco de golfe",
    WEAPON_NITESTICK = "Cacetete",
    WEAPON_KNIFE = "Faca",
    WEAPON_BAT = "Taco de beisebol",
    WEAPON_SHOVEL = "Pá",
    WEAPON_POOLSTICK = "Taco de sinuca",
    WEAPON_KATANA = "Katana",
    WEAPON_CHAINSAW = "Motosserra",
    WEAPON_DILDO = "Dildo roxo",
    WEAPON_DILDO2 = "Dildo cinza",
    WEAPON_VIBRATOR = "Vibrador rosa",
    WEAPON_VIBRATOR2 = "Vibrador branco",
    WEAPON_FLOWER = "Buquê de flores",
    WEAPON_CANE = "Bengala",
    WEAPON_GRENADE = "Granada",
    WEAPON_TEARGAS = "Gás lacrimogêneo",
    WEAPON_MOLOTOV = "Coquetel Molotov",
    WEAPON_COLT45 = "Pistola Colt .45",
    WEAPON_SILENCED = "Pistola com silenciador",
    WEAPON_DEAGLE = "Desert Eagle",
    WEAPON_SHOTGUN = "Espingarda",
    WEAPON_SAWEDOFF = "Espingarda serrada",
    WEAPON_SHOTGSPA = "SPAS-12",
    WEAPON_UZI = "Uzi",
    WEAPON_MP5 = "MP5",
    WEAPON_AK47 = "AK-47",
    WEAPON_M4 = "M4",
    WEAPON_TEC9 = "TEC-9",
    WEAPON_RIFLE = "Rifle de caça",
    WEAPON_SNIPER = "Rifle de precisão",
    WEAPON_ROCKETLAUNCHER = "Lança-foguetes",
    WEAPON_HEATSEEKER = "Lança-foguetes teleguiado",
    WEAPON_FLAMETHROWER = "Lança-chamas",
    WEAPON_MINIGUN = "Minigun",
    WEAPON_SATCHEL = "Explosivo",
    WEAPON_BOMB = "Bomba",
    WEAPON_SPRAYCAN = "Spray de tinta",
    WEAPON_FIREEXTINGUISHER = "Extintor de incêndio",
    WEAPON_CAMERA = "Câmera",
    TEPLOWIZER = "Câmera termográfica",
    TEPLOWIZER2 = "Câmera térmica 2",
    WEAPON_PARACHUTE = "Paraquedas",
}
    if #offsets > 0 then
        gg.setValues(offsets)
        local name = weaponNames[type] or type
        gg.toast("Arma entregue: " .. name)
    else
    gg.setVisible(false)
        gg.toast("❌ Não foi possível entregar a arma.")
    end
end

function TeleportPoMet()
    findAndSaveCoords(true)
    gg.clearResults()
    gg.setVisible(false)
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
        teleport()
        return
    end

    local firstFound = filtered[1]
    local baseAddr = firstFound.address

    local offset3 = baseAddr + (1 * 8)   -- X
    local offset1 = baseAddr + (1.5 * 8)  -- Z
    local offset2 = baseAddr + (2 * 8)  -- Y

    local coords = {
        {address = offset1, flags = gg.TYPE_FLOAT},  -- X
        {address = offset2, flags = gg.TYPE_FLOAT},  -- Y
        {address = offset3, flags = gg.TYPE_FLOAT},  -- Z
    }

    local values = gg.getValues(coords)
    for i, value in ipairs(values) do
        coords[i].value = value.value
    end

    gg.clearResults()

    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("4574729552438491892", gg.TYPE_QWORD)
    gg.refineNumber("4574729552438491892")
    local results = gg.getResults(1)

    if #results > 0 then
        local baseAddr = results[1].address
        local offsets = {
            {address = baseAddr + (15 * 8), flags = gg.TYPE_FLOAT},  -- X
            {address = baseAddr + (15.5 * 8), flags = gg.TYPE_FLOAT},  -- Y
            {address = baseAddr + (14.5 * 8), flags = gg.TYPE_FLOAT}   -- Z
        }

        for i = 1, #coords do
            offsets[i].value = coords[i].value
        end

        gg.setValues(offsets)
        gg.toast("Coordenadas substituídas com sucesso!")
        mainMenu()
    else
        gg.toast("❌ Valor não encontrado")
        mainMenu()
    end

    gg.clearResults()
end

function searchAndReplaceCoords()
    findAndSaveCoords(true)
    gg.toast("Aguarde 5 segundos... Coloque a marca e não mexa no mapa")
    gg.sleep(5000)
    gg.clearResults()

    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("9.21942286e-41", gg.TYPE_FLOAT)
    local first = gg.getResults(10000)
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("9.21956299e-41", gg.TYPE_FLOAT)
    local second = gg.getResults(10000)

    for _, v in ipairs(second) do
        table.insert(first, v)
    end

    local filtered = {}
    for _, v in ipairs(first) do
        if string.sub(string.format("%X", v.address), -3) == "80C" then
            table.insert(filtered, v)
        end
    end

    if #filtered == 0 then
        gg.toast("❌ Coordenadas não encontradas")
        teleport()
        return
    end

    local baseAddr = filtered[1].address

    local savedCoords = {
        {address = baseAddr - (1 * 8), flags = gg.TYPE_FLOAT},
        {address = baseAddr - (0.5 * 8), flags = gg.TYPE_FLOAT}
    }

    local values = gg.getValues(savedCoords)
    for i, v in ipairs(values) do
        savedCoords[i].value = v.value
    end

    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("4574729552438491892", gg.TYPE_QWORD)
    gg.refineNumber("4574729552438491892")
    local results = gg.getResults(1)

    if #results == 0 then
        gg.toast("❌ Marca não encontrada")
        mainMenu()
        return
    end

        local newBase = results[1].address
    local targetOffsets = {
        {address = newBase + (14.5 * 8), flags = gg.TYPE_FLOAT}, -- X
        {address = newBase + (15 * 8), flags = gg.TYPE_FLOAT}     -- Z
    }

    for i = 1, #targetOffsets do
        targetOffsets[i].value = savedCoords[i].value
    end

    table.insert(targetOffsets, {
        address = newBase + (15.5 * 8), -- Y
        flags = gg.TYPE_FLOAT,
        value = 25
    })

    gg.setValues(targetOffsets)
    gg.clearResults()
    gg.toast("Coordenadas transferidas com sucesso!")
    mainMenu()
end

local sprintActive = false
local fovActive = false
local rainActive = false

function stringToAscii(str)
    local ascii = {}
    for i = 1, #str do
        table.insert(ascii, string.byte(str, i))
    end
    return ascii
end

function searchAsciiSequence(asciiTable)
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    local searchStr = table.concat(asciiTable, ";") .. "::" .. #asciiTable
    gg.searchNumber(searchStr, gg.TYPE_BYTE)
    return gg.getResults(9999)
end

function replaceAscii(results, newAscii)
    local setList = {}
    for i = 1, #newAscii do
        table.insert(setList, {
            address = results[i].address,
            flags = gg.TYPE_BYTE,
            value = newAscii[i]
        })
    end
    gg.setValues(setList)
end

function changeTwinNick()
    local oldNick = gg.prompt({"Digite o nick atual:"}, nil, {"text"})
    if not oldNick or not oldNick[1] then
        gg.toast("❌ Nick não inserido")
        return
    end

    local oldAscii = stringToAscii(oldNick[1])
    local results = searchAsciiSequence(oldAscii)

    if #results == 0 then
        gg.toast("❌ Nick não encontrado")
        return
    end

    local newNick = gg.prompt({"Digite o novo nick (mesmo comprimento):"}, nil, {"text"})
    if not newNick or not newNick[1] then
        gg.toast("❌ Novo nick não inserido")
        return
    end

    if #newNick[1] ~= #oldNick[1] then
        gg.toast("❌ O novo nick deve ter o mesmo comprimento!")
        return
    end

    local newAscii = stringToAscii(newNick[1])
    replaceAscii(results, newAscii)

    gg.toast("✅ Nick alterado para: " .. newNick[1])
end

--------------------------------------------------------------

function changeChatNickSafe()
    local oldNick = gg.prompt({"Digite o nick atual (como no chat):"}, nil, {"text"})
    if not oldNick or not oldNick[1] then
        gg.toast("❌ Nick não inserido")
        return
    end
    
    local newNick = gg.prompt({"Digite o novo nick:"}, nil, {"text"})
    if not newNick or not newNick[1] then
        gg.toast("❌ Novo nick não inserido")
        return
    end

    if #oldNick[1] ~= #newNick[1] then
        gg.toast("❌ O comprimento do nick deve ser igual")
        return
    end

    gg.setRanges(gg.REGION_JAVA_HEAP)
    local byteArray = {}
    for i = 1, #oldNick[1] do
        byteArray[#byteArray + 1] = string.byte(oldNick[1], i) .. "B"
    end
    local searchString = table.concat(byteArray, ";") .. "::" .. #byteArray

    gg.clearResults()
    gg.searchNumber(searchString, gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)
    local results = gg.getResults(500)

    if #results == 0 then
        gg.toast("❌ Nick não encontrado")
        return
    end

    local setList = {}
    for _, v in ipairs(results) do
        local currentBytes = {}
        for j = 1, #oldNick[1] do
            currentBytes[j] = gg.getValues({{address = v.address + (j - 1), flags = gg.TYPE_BYTE}})[1].value
        end

        local isOldNick = true
        for j = 1, #oldNick[1] do
            if currentBytes[j] ~= string.byte(oldNick[1], j) then
                isOldNick = false
                break
            end
        end

        local isAlreadyNew = true
        for j = 1, #newNick[1] do
            if currentBytes[j] ~= string.byte(newNick[1], j) then
                isAlreadyNew = false
                break
            end
        end

        if isOldNick and not isAlreadyNew then
            for j = 1, #newNick[1] do
                table.insert(setList, {
                    address = v.address + (j - 1),
                    flags = gg.TYPE_BYTE,
                    value = string.byte(newNick[1], j)
                })
            end
        end
    end

    if #setList / #newNick[1] > 50 then
        gg.toast("⚠️ Encontradas muitas correspondências, apenas as primeiras 50 foram alteradas")
        setList = {table.unpack(setList, 1, 50 * #newNick[1])}
    end

    if #setList > 0 then
        gg.setValues(setList)
        gg.toast("✅ Nick alterado")
    else
        gg.toast("ℹ️ Todos os valores encontrados já estavam alterados ou não coincidem")
    end
end

function changeNik()
    gg.setVisible(false)
    local choice = gg.choice({
        "✏ Mudar o apelido de outra pessoa",
        "📜 Alterar apelido do chat",
        "❌ Sair"
    }, nil, "Selecione uma ação:")

    if choice == 1 then
        changeTwinNick()
    elseif choice == 2 then
        changeChatNickSafe()
    elseif choice == 3 then
        os.exit()
    end
end

function toggleSprint()
    if not sprintActive then
        dv1()
        sprintActive = true
    else
        dv2()
        sprintActive = false
    end
end

function toggleFov()
    if not fovActive then
        fov1()
        fovActive = true
    else
        fov2()
        fovActive = false
    end
end

function toggleRain()
    if not rainActive then
        dojd1()
        rainActive = true
    else
        dojd2()
        rainActive = false
    end
end

function dv1()
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("4.0;0.69999998808;0.20000000298;5.0;10.0;1.0;0.5;0.30000001192:29", gg.TYPE_FLOAT)
    gg.refineNumber("0.7", gg.TYPE_FLOAT)
    revert = gg.getResults(100000)
    gg.editAll("-0.565651", gg.TYPE_FLOAT)
    gg.toast("❗SPRINT ATIVADO❗")
    gg.clearResults()
end

function dv2()
    gg.clearResults()
    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("4.0;-0.565651;0.20000000298;5.0;10.0;1.0;0.5;0.30000001192:29", gg.TYPE_FLOAT)
    gg.refineNumber("-0.565651", gg.TYPE_FLOAT)
    revert = gg.getResults(100000)
    gg.editAll("0.7", gg.TYPE_FLOAT)
    gg.toast("❗SPRINT DESATIVADO❗")
    gg.clearResults()
end

function fov1() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1116471296", gg.TYPE_DWORD)
    revert = gg.getResults(300)
    gg.editAll("1122469536", gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("❗FOV ATIVADO❗")
end 

function fov2() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1122469536", gg.TYPE_DWORD)
    revert = gg.getResults(300)
    gg.editAll("1116471296", gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("❗FOV DESATIVADO❗")
end 

function dojd1() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("0.00499999989", gg.TYPE_FLOAT)
    revert = gg.getResults(300)
    gg.editAll("-25.84625", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("❗CHUVA ATIVADA❗")
end 

function dojd2() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("-25.84625", gg.TYPE_FLOAT)
    revert = gg.getResults(300)
    gg.editAll("0.00499999989", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("❗CHUVA DESATIVADA❗")
end

local baxActive = false

local function teleportToCheckpointCar()
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for i, v in ipairs(savedList) do
        if v.name == "Car_X" then savedX = v end
        if v.name == "Car_Y" then savedY = v end
        if v.name == "Car_Z" then savedZ = v end
    end
    if not (savedX and savedY and savedZ) then
        gg.alert("❌ Primeiro salve as coordenadas.")
        return
    end

    savedX.value = 0
    savedY.value = 30
    savedZ.value = -1370
    gg.setValues({savedX, savedY, savedZ})
    gg.toast("➡ Teleporte para (0, 0, 0)")
    gg.sleep(5000)

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
        gg.alert("❌ Checkpoint não encontrado")
        return
    end

    local firstFound = filtered[1]
    local baseAddr = firstFound.address

    local offset3 = baseAddr + (2 * 8)   -- X
    local offset1 = baseAddr + (1 * 8) -- Z
    local offset2 = baseAddr + (1.5* 8)   -- Y

    local coords = {
        {address = offset1, flags = gg.TYPE_FLOAT},  -- X
        {address = offset2, flags = gg.TYPE_FLOAT},  -- Y
        {address = offset3, flags = gg.TYPE_FLOAT},  -- Z
    }

    local values = gg.getValues(coords)
    for i, value in ipairs(values) do
        coords[i].value = value.value
    end

    savedX.value = coords[1].value
    savedY.value = coords[2].value
    savedZ.value = coords[3].value
    gg.setValues({savedX, savedY, savedZ})
    gg.toast("✅ Teleporte para o checkpoint concluído!")
    gg.clearResults()
end

function teleportToMarkerCar() 
    gg.toast("Aguarde 5 segundos... Coloque a marca e não mexa no mapa")
    gg.sleep(5000)
    gg.clearResults()

    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("9.21942286e-41", gg.TYPE_FLOAT)
    local first = gg.getResults(10000)

    gg.setRanges(gg.REGION_OTHER)
    gg.searchNumber("9.21956299e-41", gg.TYPE_FLOAT)
    local second = gg.getResults(10000)

    for _, v in ipairs(second) do
        table.insert(first, v)
    end

    local filtered = {}
    for _, v in ipairs(first) do
        if string.sub(string.format("%X", v.address), -3) == "80C" then
            table.insert(filtered, v)
        end
    end

    if #filtered == 0 then
        gg.toast("❌ Marca não encontrada")
        return
    end

    local baseAddr = filtered[1].address
    local savedCoords = {
        {address = baseAddr - (1 * 8), flags = gg.TYPE_FLOAT},   -- X
        {address = baseAddr - (0.5 * 8), flags = gg.TYPE_FLOAT}  -- Z
    }

    local values = gg.getValues(savedCoords)
    for i, v in ipairs(values) do
        savedCoords[i].value = v.value
    end

    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for _, v in ipairs(savedList) do
        if v.name == "Car_X" then savedX = v end
        if v.name == "Car_Y" then savedY = v end
        if v.name == "Car_Z" then savedZ = v end
    end

    if not (savedX and savedY and savedZ) then
        gg.alert("❌ Primeiro salve as coordenadas")
        return
    end

    savedX.value = 0
    savedY.value = 30
    savedZ.value = -1370
    gg.setValues({savedX, savedY, savedZ})
    gg.toast("➡ Teleporte para (0,30,-1370)")
    gg.sleep(2000)

    savedX.value = savedCoords[1].value
    savedZ.value = savedCoords[2].value
    savedY.value = 55
    gg.setValues({savedX, savedY, savedZ})
    gg.toast("✅ Teleporte para a marca concluído!")
end

  function botTaxi()
    gg.toast("🚖 Bot táxi iniciado!")
    while true do
        teleportToCheckpointCar()
        gg.sleep(2000)
        teleportToCheckpointCar()
        gg.sleep(10000)
        teleportToCheckpointCar()
        gg.sleep(2000)
        teleportToCheckpointCar()
        if gg.isVisible(true) then
            gg.setVisible(false)
            gg.toast("⛔ Bot táxi parado")
            break
        end
    end
end

function cycleCheckpoints()
    toggleFreezeCarHP() 
    findCarCoords()
    gg.toast("Aguardando 10 segundos")
    gg.sleep(10000)

local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for i, v in ipairs(savedList) do
        if v.name == "Car_X" then savedX = v end
        if v.name == "Car_Y" then savedY = v end
        if v.name == "Car_Z" then savedZ = v end
    end
    if not (savedX and savedY and savedZ) then
        gg.alert("❌ Primeiro salve as coordenadas.")
        return
    end

    local checkpointAddr = nil
    local lastX, lastY, lastZ = nil, nil, nil
    local unchangedCount = 0

    while true do
        gg.clearResults()
        if checkpointAddr == nil then
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
                gg.alert("❌ Checkpoint não encontrado")
                return
            end

            checkpointAddr = filtered[1].address
            gg.toast("✅ Checkpoint encontrado!")
        end

        local offset3 = checkpointAddr + (1 * 8)   -- X
        local offset1 = checkpointAddr + (2 * 8)   -- Z
        local offset2 = checkpointAddr + (1.5 * 8) -- Y

        local coords = {
            {address = offset1, flags = gg.TYPE_FLOAT}, -- X
            {address = offset2, flags = gg.TYPE_FLOAT}, -- Y
            {address = offset3, flags = gg.TYPE_FLOAT}, -- Z
        }

        local values = gg.getValues(coords)

        if lastX == values[1].value and lastY == values[2].value and lastZ == values[3].value then
            unchangedCount = unchangedCount + 1
        else
            unchangedCount = 0
        end

        savedX.value = 0
        savedY.value = 30
        savedZ.value = -1370
        gg.setValues({savedX, savedY, savedZ})
        gg.toast("➡ Teleporte para (0, 30, -1370)")
        gg.sleep(1500)
        
        savedX.value = values[1].value
        savedY.value = values[2].value
        savedZ.value = values[3].value
        gg.setValues({savedX, savedY, savedZ})

        gg.toast("🔄 Movendo para checkpoint: X:"..values[1].value.." Y:"..values[2].value.." Z:"..values[3].value)
        if unchangedCount >= 3 then
            gg.toast("✅ Coordenadas pararam de atualizar, script finalizado")
            break
        end
        lastX, lastY, lastZ = values[1].value, values[2].value, values[3].value
        gg.sleep(1000) 
    end
end

function botAir()
    toggleFreezeAirHP() 
    gg.sleep(1500)
    findCarCoords()
    gg.toast("Aguardando 5 segundos")
    gg.sleep(5000)
        
local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for i, v in ipairs(savedList) do
        if v.name == "Car_X" then savedX = v end
        if v.name == "Car_Y" then savedY = v end
        if v.name == "Car_Z" then savedZ = v end
    end
    if not (savedX and savedY and savedZ) then
        gg.alert("❌ Primeiro salve as coordenadas.")
        return
    end

    local checkpointAddr = nil
    local lastX, lastY, lastZ = nil, nil, nil
    local unchangedCount = 0

    while true do
        gg.clearResults()
        if checkpointAddr == nil then
            gg.setRanges(gg.REGION_OTHER)
            gg.searchNumber("3,68946096e11", gg.TYPE_FLOAT)
            local results = gg.getResults(1000000)

            local filtered = {}
            for _, v in ipairs(results) do
                if string.sub(string.format("%X", v.address), -3) == "278" then
                    table.insert(filtered, v)
                    break
                end
            end

            if #filtered == 0 then
                gg.alert("❌ Checkpoint não encontrado")
                return
            end

            checkpointAddr = filtered[1].address
            gg.toast("✅ Checkpoint encontrado!")
        end
        local offset3 = checkpointAddr + (1 * 8)   -- X
        local offset1 = checkpointAddr + (2 * 8)   -- Z
        local offset2 = checkpointAddr + (1.5 * 8) -- Y

        local coords = {
            {address = offset1, flags = gg.TYPE_FLOAT}, -- X
            {address = offset2, flags = gg.TYPE_FLOAT}, -- Y
            {address = offset3, flags = gg.TYPE_FLOAT}, -- Z
        }

        local values = gg.getValues(coords)
        if lastX == values[1].value and lastY == values[2].value and lastZ == values[3].value then
            unchangedCount = unchangedCount + 1
        else
            unchangedCount = 0
        end
        savedX.value = values[1].value
        savedY.value = values[2].value
        savedZ.value = values[3].value
        gg.setValues({savedX, savedY, savedZ})
        gg.toast("🔄 Movendo para checkpoint") 
        if unchangedCount >= 3 then
            gg.toast("✅ Checkpoint não encontrado, script finalizado")
            break
        end
        lastX, lastY, lastZ = values[1].value, values[2].value, values[3].value
        gg.sleep(1000) 
    end
end

local FLOAT = gg.TYPE_FLOAT

local function getFirst3Coords()
    local list = gg.getListItems()
    if #list < 3 then
        findAndSaveCoords()
        list = gg.getListItems()
        if #list < 3 then
            gg.toast("❌ Erro: coordenadas não encontradas!")
            return nil
        end
    end
    return {list[1], list[2], list[3]}
end

local function teleport(tx, ty, tz)
    if not (tx and ty and tz) then
        return
    end

    local saved = getFirst3Coords()
    if not saved then return end
    if not (saved[1].address and saved[2].address and saved[3].address) then
        gg.toast("❌ Erro: endereços de coordenadas são nil")
        return
    end

    gg.setValues({
        {address = saved[1].address, flags = FLOAT, value = tx},
        {address = saved[2].address, flags = FLOAT, value = ty},
        {address = saved[3].address, flags = FLOAT, value = tz}
    })
end

local pumps = {
    {x = -2094, y = 1550, z = 45},--1
    {x = -1822, y = -187, z = 37},--2  
    {x = -146, y = -2024, z = 32},--3
    {x = -2728, y = 2794, z = 2},--4
    {x = -2747, y = 2813, z = 2},--5
    {x = -2805, y = 2813, z = 2},--6
    {x = -2798, y = 2777, z = 2},--7
    {x = -2750, y = 2768, z = 2},--8
    {x = -2798, y = 2753, z = 2},--9
    {x = -2791, y = 2726, z = 2},--10
    {x = -2748, y = 2730, z = 2},--11
    {x = -2667, y = 2883, z = 2},--12
    {x = -2481, y = 2846, z = 5},--13
    {x = -1392, y = 2517, z = 44},--14
    {x = -1607, y = 1457, z = 50},--15
    {x = -2094, y = 1128, z = 5},--16
    {x = -2709, y = 2134, z = 27},--17
    {x = -2214, y = -39, z = 13},--18
    {x = -2217, y = 186, z = 11},--19
    {x = -2034, y = -28, z = 12},--20
    {x = -1996, y = -179, z = 11},--21
    {x = 2351, y = 1989, z = 17},--22
    {x = 1371, y = 963, z = 14},--23
    {x = 1642, y = 1010, z = 14},--24
    {x = 1592, y = 1003, z = 14},--25
    {x = 1858, y = 2038, z = 16},--26
    {x = 445, y = 1171, z = 13},--27
    {x = 342, y = -1926, z = 42},--28
    {x = -1077, y = -1616, z = 49},--29
    {x = -777, y = 782, z = 15},--30
    {x = -141, y = 853, z = 13},--31
    {x = -116, y = 811, z = 13},--32
    {x = 148, y = 763, z = 13},--33
    {x = 355, y = 1360, z = 12},--34
    {x = -2239, y = 1965, z = 51},--35
    {x = -1966, y = -291, z = 22},--36
    {x = -2172, y = 311, z = 12},--37
    {x = -2229, y = 296, z = 12},--38
    {x = -2142, y = 250, z = 12},--39
    {x = -2065, y = 264, z = 11},--40
    {x = -2073, y = 175, z = 11},--41
    {x = -2167, y = 202, z = 13},--42
    {x = -2183, y = 247, z = 12},--43
    {x = 2490, y = 346, z = 32},--44
    {x = -2517, y = 181, z = 12},--45
    {x = -2217, y = 186, z = 11},--46
    {x = -2597, y = 109, z = 11},--47
    {x = -2408, y = 397, z = 11},--48
    {x = 2516, y = -188, z = 4},--49
    {x = 2043, y = 1396, z = 27},--50
    {x = 2554, y = -2188, z = 23},--51
    {x = 2325, y = -1814, z = 23},--52
    {x = 533, y = 329, z = 13},--53
    {x = 1133, y = 423, z = 13},--54
    {x = 412, y = 579, z = 13},--55
    {x = 181, y = 446, z = 12},--56
    {x = -285, y = 100, z = 14},--57
    {x = -458, y = 899, z = 12},--58
    {x = -44, y = 909, z = 13},--59
    {x = 1896, y = 1909, z = 14},--60
    {x = 1796, y = 2514, z = 16},--61
    {x = -218, y = 1024, z = 13},--62
    {x = -1885, y = 201, z = 12},--63
    {x = 1874, y = 1224, z = 34},--64
    {x = 158, y = 2022, z = 9},--65
    {x = -8, y = 1360, z = 13},--66
    {x = 1301, y = 2812, z = 13},--67
    {x = 1229.70, y = 1060.70, z = 49}--68
}

-- Основной бот
function bot_pumps()
    teleport(pumps[1].x, pumps[1].y, pumps[1].z)--2
    gg.sleep(3000)
    teleport(pumps[2].x, pumps[2].y, pumps[2].z)--2
    gg.sleep(3000)
    teleport(pumps[3].x, pumps[3].y, pumps[3].z)--3
    gg.sleep(3000)
    teleport(pumps[4].x, pumps[4].y, pumps[4].z)--4
    gg.sleep(3000)
    teleport(pumps[5].x, pumps[5].y, pumps[5].z)--5
    gg.sleep(3000)
    teleport(pumps[6].x, pumps[6].y, pumps[6].z)--6
    gg.sleep(3000)
    teleport(pumps[7].x, pumps[7].y, pumps[7].z)--7
    gg.sleep(3000)
    teleport(pumps[8].x, pumps[8].y, pumps[8].z)--8
    gg.sleep(3000)
    teleport(pumps[9].x, pumps[9].y, pumps[9].z)--9
    gg.sleep(3000)
    teleport(pumps[10].x, pumps[10].y, pumps[10].z)--10
    gg.sleep(3000)
    teleport(pumps[11].x, pumps[11].y, pumps[11].z)--11
    gg.sleep(3000)
    teleport(pumps[12].x, pumps[12].y, pumps[12].z)--12
    gg.sleep(3000)
    teleport(pumps[13].x, pumps[13].y, pumps[13].z)--13
    gg.sleep(3000)
    teleport(pumps[14].x, pumps[14].y, pumps[14].z)--14
    gg.sleep(3000)
    teleport(pumps[15].x, pumps[15].y, pumps[15].z)--15
    gg.sleep(3000)
    teleport(pumps[16].x, pumps[16].y, pumps[16].z)--16
    gg.sleep(3000)
    teleport(pumps[17].x, pumps[17].y, pumps[17].z)--17
    gg.sleep(3000)
    teleport(pumps[18].x, pumps[18].y, pumps[18].z)--18
    gg.sleep(3000)
    teleport(pumps[19].x, pumps[19].y, pumps[19].z)--19
    gg.sleep(3000)
    teleport(pumps[20].x, pumps[20].y, pumps[20].z)--20
    gg.sleep(3000)
    teleport(pumps[21].x, pumps[21].y, pumps[21].z)--21
    gg.sleep(3000)
    teleport(pumps[22].x, pumps[22].y, pumps[22].z)--22
    gg.sleep(3000)
    teleport(pumps[23].x, pumps[23].y, pumps[23].z)--23
    gg.sleep(3000)
    teleport(pumps[24].x, pumps[24].y, pumps[24].z)--24
    gg.sleep(3000)
    teleport(pumps[25].x, pumps[25].y, pumps[25].z)--25
    gg.sleep(3000)
    teleport(pumps[26].x, pumps[26].y, pumps[26].z)--26
    gg.sleep(3000)
    teleport(pumps[27].x, pumps[27].y, pumps[27].z)--27
    gg.sleep(3000)
    teleport(pumps[28].x, pumps[28].y, pumps[28].z)--28
    gg.sleep(3000)
    teleport(pumps[29].x, pumps[29].y, pumps[29].z)--29
    gg.sleep(3000)
    teleport(pumps[30].x, pumps[30].y, pumps[30].z)--30
    gg.sleep(3000)
    teleport(pumps[31].x, pumps[31].y, pumps[31].z)--31
    gg.sleep(3000)
    teleport(pumps[32].x, pumps[32].y, pumps[32].z)--32
    gg.sleep(3000)
    teleport(pumps[33].x, pumps[33].y, pumps[33].z)--33
    gg.sleep(3000)
    teleport(pumps[34].x, pumps[34].y, pumps[34].z)--34
    gg.sleep(3000)
    teleport(pumps[35].x, pumps[35].y, pumps[35].z)--35
    gg.sleep(3000)
    teleport(pumps[36].x, pumps[36].y, pumps[36].z)--36
    gg.sleep(3000)
    teleport(pumps[37].x, pumps[37].y, pumps[37].z)--37
    gg.sleep(3000)
    teleport(pumps[38].x, pumps[38].y, pumps[38].z)--38
    gg.sleep(3000)
    teleport(pumps[39].x, pumps[39].y, pumps[39].z)--39
    gg.sleep(3000)
    teleport(pumps[40].x, pumps[40].y, pumps[40].z)--40
    gg.sleep(3000)
    teleport(pumps[41].x, pumps[41].y, pumps[41].z)--41
    gg.sleep(3000)
    teleport(pumps[42].x, pumps[42].y, pumps[42].z)--42
    gg.sleep(3000)
    teleport(pumps[43].x, pumps[43].y, pumps[43].z)--43
    gg.sleep(3000)
    teleport(pumps[44].x, pumps[44].y, pumps[44].z)--44
    gg.sleep(3000)
    teleport(pumps[45].x, pumps[45].y, pumps[45].z)--45
    gg.sleep(3000)
    teleport(pumps[46].x, pumps[46].y, pumps[46].z)--46
    gg.sleep(3000)
    teleport(pumps[47].x, pumps[47].y, pumps[47].z)--47
    gg.sleep(3000)
    teleport(pumps[48].x, pumps[48].y, pumps[48].z)--48
    gg.sleep(3000)
    teleport(pumps[49].x, pumps[49].y, pumps[49].z)--49
    gg.sleep(3000)
    teleport(pumps[50].x, pumps[50].y, pumps[50].z)--50
    gg.sleep(3000)
    teleport(pumps[51].x, pumps[51].y, pumps[51].z)--51
    gg.sleep(3000)
    teleport(pumps[52].x, pumps[52].y, pumps[52].z)--52
    gg.sleep(3000)
    teleport(pumps[53].x, pumps[53].y, pumps[53].z)--53
    gg.sleep(3000)
    teleport(pumps[54].x, pumps[54].y, pumps[54].z)--54
    gg.sleep(3000)
    teleport(pumps[55].x, pumps[55].y, pumps[55].z)--55
    gg.sleep(3000)
    teleport(pumps[56].x, pumps[56].y, pumps[56].z)--56
    gg.sleep(3000)
    teleport(pumps[57].x, pumps[57].y, pumps[57].z)--57
    gg.sleep(3000)
    teleport(pumps[58].x, pumps[58].y, pumps[58].z)--58
    gg.sleep(3000)
    teleport(pumps[59].x, pumps[59].y, pumps[59].z)--59
    gg.sleep(3000)
    teleport(pumps[60].x, pumps[60].y, pumps[60].z)--60
    gg.sleep(3000)
    teleport(pumps[61].x, pumps[61].y, pumps[61].z)--61
    gg.sleep(3000)
    teleport(pumps[62].x, pumps[62].y, pumps[62].z)--62
    gg.sleep(3000)
    teleport(pumps[63].x, pumps[63].y, pumps[63].z)--63
    gg.sleep(3000)
    teleport(pumps[64].x, pumps[64].y, pumps[64].z)--64
    gg.sleep(3000)
    teleport(pumps[65].x, pumps[65].y, pumps[65].z)--65
    gg.sleep(3000)
    teleport(pumps[66].x, pumps[66].y, pumps[66].z)--66
    gg.sleep(3000)
    teleport(pumps[67].x, pumps[67].y, pumps[67].z)--67
    gg.sleep(3000)
    teleport(pumps[68].x, pumps[68].y, pumps[68].z)--68
    gg.sleep(5000)
    bot_pumps()
end

local candy = {
    {x = 1597, y = 984, z = 14}, --1
    {x = 1621, y = 991, z = 14},--2  
    {x = 1615, y = 1013, z = 14},--3
    {x = 1605, y = 1061, z = 14},--4
    {x = 1620, y = 1044, z = 14},--5
    {x = 1599, y = 1075, z = 14},--6
    {x = 1560, y = 1062, z = 14},--7
    {x = 1595, y = 1065, z = 18},--8
    {x = 1636, y = 1069, z = 18},--9
    {x = 1648, y = 1073, z = 20},--10
    {x = 1655, y = 1070, z = 14},--11
    {x = 1642, y = 1036, z = 14},--12
    {x = 1676, y = 1057, z = 17},--13
    {x = 1693, y = 996, z = 14},--14
    {x = 1711, y = 977, z = 14},--15
    {x = 1671, y = 962, z = 14},--16
    {x = 1688, y = 973, z = 16},--17
    {x = 1643, y = 1002, z = 19},--18
    {x = 1669, y = 1016, z = 13},--19
    {x = 1645, y = 989, z = 14},--20
    {x = 1620, y = 961, z = 14},--21
    {x = 1636, y = 1013, z = 14},--22
    {x = 1685, y = 1026, z = 14},--23
    {x = 1643, y = 1088, z = 14},--24
    {x = 1669, y = 1085, z = 14},--25
    {x = 1593, y = 1043, z = 14}--26   
}

-- Основной бот
function bot_candy()
    teleport(candy[1].x, candy[1].y, candy[1].z)--1
    gg.sleep(2000)
    teleport(candy[2].x, candy[2].y, candy[2].z)--2
    gg.sleep(2000)
    teleport(candy[3].x, candy[3].y, candy[3].z)--3
    gg.sleep(2000)
    teleport(candy[4].x, candy[4].y, candy[4].z)--4
    gg.sleep(2000)
    teleport(candy[5].x, candy[5].y, candy[5].z)--5
    gg.sleep(2000)
    teleport(candy[6].x, candy[6].y, candy[6].z)--6
    gg.sleep(2000)
    teleport(candy[7].x, candy[7].y, candy[7].z)--7
    gg.sleep(2000)
    teleport(candy[8].x, candy[8].y, candy[8].z)--8
    gg.sleep(2000)
    teleport(candy[9].x, candy[9].y, candy[9].z)--9
    gg.sleep(2000)
    teleport(candy[10].x, candy[10].y, candy[10].z)--10
    gg.sleep(2000)
    teleport(candy[11].x, candy[11].y, candy[11].z)--11
    gg.sleep(2000)
    teleport(candy[12].x, candy[12].y, candy[12].z)--12
    gg.sleep(2000)
    teleport(candy[13].x, candy[13].y, candy[13].z)--13
    gg.sleep(2000)
    teleport(candy[14].x, candy[14].y, candy[14].z)--14
    gg.sleep(2000)
    teleport(candy[15].x, candy[15].y, candy[15].z)--15
    gg.sleep(2000)
    teleport(candy[16].x, candy[16].y, candy[16].z)--16
    gg.sleep(2000)
    teleport(candy[17].x, candy[17].y, candy[17].z)--17
    gg.sleep(2000)
    teleport(candy[18].x, candy[18].y, candy[18].z)--18
    gg.sleep(2000)
    teleport(candy[19].x, candy[19].y, candy[19].z)--19
    gg.sleep(2000)
    teleport(candy[20].x, candy[20].y, candy[20].z)--20
    gg.sleep(2000)
    teleport(candy[21].x, candy[21].y, candy[21].z)--21
    gg.sleep(2000)
    teleport(candy[22].x, candy[22].y, candy[22].z)--22
    gg.sleep(2000)
    teleport(candy[23].x, candy[23].y, candy[23].z)--23
    gg.sleep(2000)
    teleport(candy[24].x, candy[24].y, candy[24].z)--24
    gg.sleep(2000)
    teleport(candy[25].x, candy[25].y, candy[25].z)--25
    gg.sleep(2000)
    teleport(candy[26].x, candy[26].y, candy[26].z)--26
    gg.sleep(2000)
    bot_candy() 
end

local sequence = {
    {x = -806.40246582031, y = 782.3818359375, z = 13.10230064392},
    {x = -806.40246582031, y = 782.3818359375, z = 0.0}, 
    {x = -806.24920654297, y = 790.70220947266, z = 13.10230064392},
    {x = -806.24920654297, y = 790.70220947266, z = 0.0}
}

-- Основной бот
function bot_Neftezavod()
    teleport(sequence[1].x, sequence[1].y, sequence[1].z)
    gg.sleep(500)
    teleport(sequence[2].x, sequence[2].y, sequence[2].z)
    gg.sleep(500)
    gg.toast("Aguardando 20 segundos...")
    gg.sleep(20000)
    teleport(sequence[3].x, sequence[3].y, sequence[3].z)
    gg.sleep(500)
    teleport(sequence[4].x, sequence[4].y, sequence[4].z)
    gg.sleep(500)
    bot_Neftezavod()
end

function cleanupOnExit()
    gg.removeListItems(gg.getListItems())
    gg.clearResults()
    gg.toast("Todos os dados salvos foram removidos!")
end

function teleportToLocation(location)
    local x = location.x
    local y = location.y
    local z = location.z

    local savedValues = gg.getListItems()
    if #savedValues >= 3 then
        savedValues[1].value = x
        savedValues[2].value = y
        savedValues[3].value = z
        gg.setValues(savedValues)

        gg.toast("Teleportando para " .. location.name .. " (X: " .. x .. ", Y: " .. y .. ", Z: " .. z .. ")")
        gg.sleep(1000)
        gg.toast("Teleporte concluído!")
        mainMenu()
    else
        gg.toast("❌ Erro: nenhuma coordenada salva")
        teleport()
    end
end

function teleportManualCar()
    local savedList = gg.getListItems()
    local savedX, savedY, savedZ = nil, nil, nil
    for i, v in ipairs(savedList) do
        if v.name == "Car_X" then savedX = v end
        if v.name == "Car_Y" then savedY = v end
        if v.name == "Car_Z" then savedZ = v end
    end
    if not (savedX and savedY and savedZ) then
        gg.alert("❌ Primeiro salve as coordenadas.")
        return
    end
    local savedValues = gg.getListItems()
    if #savedValues >= 3 then
        local input = gg.prompt({"Digite X:", "Digite Y:", "Digite Z:"},
            {savedValues[1].value, savedValues[2].value, savedValues[3].value},
            {"number", "number", "number"})

        if input then
            savedValues[1].value = input[1]
            savedValues[2].value = input[2]
            savedValues[3].value = input[3]

            gg.setValues(savedValues)
            gg.toast("Teleporte concluído!")
            mainMenu()
        else
            gg.toast("❌ Teleporte cancelado")
            teleport()
        end
    else
        gg.toast("❌ Erro: coordenadas salvas não encontradas!")
        teleportCar()
    end
end

function teleportCar()
    gg.setVisible(false)
    local choice = gg.choice({
        "🔍 Encontrar e salvar coordenadas (Novo)",
        "🔎 Encontrar e salvar coordenadas (Antigo)", 
        "💾 Pontos salvos",
        "🚀 Teleporte por coordenadas",
        "✅ Teleporte por marca",
        "🧾 Teleporte por checkpoint",
        "🔙 Voltar"
    }, nil, "Escolha uma ação")

    if choice == 1 then
        findCarCoords()
    elseif choice == 2 then
        local cands = findCoords()
        if cands then
            local filtered = twoChecks(cands)
            if filtered then
                processValues(filtered)
            end
        end
    elseif choice == 3 then
        userSavedPointsMenucar() 
    elseif choice == 4 then
        teleportManualCar()
    elseif choice == 5 then
        teleportToMarkerCar()
    elseif choice == 6 then
        teleportToCheckpointCar()
    elseif choice == 7 or choice == nil then
        transportMenu()
    end
end

function toggleBax()
    if not baxActive then
        bax()
        baxActive = true
    else
        bax2()
        baxActive = false
    end
end

function bax() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("250.0", gg.TYPE_FLOAT)
    revert = gg.getResults(1000)
    gg.editAll("1000.0234765", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("❗FUNÇÃO ATIVADA❗")
end 

function bax2() 
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber("1000.0234765", gg.TYPE_FLOAT)
    revert = gg.getResults(1000)
    gg.editAll("250.0", gg.TYPE_FLOAT)
    gg.clearResults()
    gg.toast("❗FUNÇÃO DESATIVADA❗")
end

local hpFrozen = false
local savedItems = {}

function toggleFreezeCarHP()
    gg.toast("use esta função quando o carro tiver 100hp")
    gg.sleep(500)
    gg.clearResults()
    if not hpFrozen then
        gg.setRanges(gg.REGION_C_ALLOC)
        gg.searchNumber("4934256341737799680", gg.TYPE_QWORD)
        gg.refineNumber("4934256341737799680")
        local results = gg.getResults(1000000)

        if #results > 0 then
            local setList = {}
            for i, result in ipairs(results) do
                local hpAddr = result.address + (0.5 * 8)
                table.insert(setList, {
                    address = hpAddr,
                    flags = gg.TYPE_FLOAT,
                    value = 1200,
                    freeze = true
                })
            end

            gg.setValues(setList)
            gg.addListItems(setList)
            savedItems = setList
            hpFrozen = true
            gg.toast("✅ Godmode ativado")
        else
            gg.toast("❌ Valor não encontrado")
        end

        gg.clearResults()
    else
        for i = 1, #savedItems do
            savedItems[i].freeze = false
        end
        gg.setValues(savedItems)
        gg.removeListItems(savedItems)
        savedItems = {}
        hpFrozen = false
        gg.toast("❌ Godmode desativado")
    end
end

function toggleFreezeAirHP()
    gg.clearResults()
    gg.clearList() 
    if not hpFrozen then
        gg.setRanges(gg.REGION_C_ALLOC)
        gg.searchNumber("4934256341737799680", gg.TYPE_QWORD)
        gg.refineNumber("4934256341737799680")
        local results = gg.getResults(1000000)

        if #results > 0 then
            local setList = {}
            for i, result in ipairs(results) do
                local hpAddr = result.address + (0.5 * 8)
                table.insert(setList, {
                    address = hpAddr,
                    flags = gg.TYPE_FLOAT,
                    value = 12000,
                    freeze = true
                })
            end

            gg.setValues(setList)
            gg.addListItems(setList)
            savedItems = setList
            hpFrozen = true
            gg.toast("✅ Godmode ativado")
        else
            gg.toast("❌ Valor não encontrado")
        end
        gg.clearResults()
    end
end


local teleportCategories = {
    ["1.Obras"] = {
        {name = "Refinaria (Trabalho inicial)", x = -823, y = 765 , z = 13},
        {name = "Serraria (Trabalho inicial) ", x = 2728 , y = -1695, z = 23},
        {name = "Fábrica de móveis (Trabalho inicial)", x = 2321, y = 2031, z = 16},
        {name = "Motorista de ônibus", x = -483, y = 882, z = 12},
        {name = "Entregador de comida", x = 257, y = 1725, z = 8},
        {name = "Mina", x = -1364, y = 2644 , z = 40},
        {name = "Estação de mecânicos", x = 390, y = 807, z = 12},
        {name = "Motorista de caminhão de lixo", x = 1757, y = 2239, z = 16},
        {name = "Carro-forte", x = -2081, y = 1928, z = 52},
        {name = "Ladrão de veículos", x = 2163, y = -1856, z = 20},
        {name = "Mergulhador", x = 2427, y = 241, z = 5},        
    },
    ["2.Locais públicos"] = {
        {name = "Autoescola", x = -508, y = 64, z = 13},
        {name = "Junta militar", x = 1916, y = 2302, z = 16},
        {name = "Moscou City", x = -221, y = 101, z = 13},
        {name = "Rodoviária de Batyrevo", x = 1814, y = 2514, z = 15},
        {name = "Rodoviária de Arzamas", x = -476, y = 913, z = 12},
        {name = "Parque Arzamas", x = -47, y = 914, z = 12},
        {name = "Igreja", x = 1879, y = 1168, z = 30},
        {name = "Píer", x = -449, y = -45, z = 2},
        {name = "Escola de aviação", x = -558, y = 39, z = 14},
    },
    ["3.ZAutosalons"] = {
        {name = "AutoHouse", x = 430, y = 1173, z = 12},
        {name = "ArzamasCars", x = 455, y = 2200, z = 12},
        {name = "AutoPátio", x = 2324, y = -1804, z = 22},
        {name = "MotoStyle", x = -1691, y = 1733, z = 48},
        {name = "Mercado de aviação", x = -1117, y = -1326, z = 48},
        {name = "Mercado de carros", x = 2424, y = -1832, z = 22},
        {name = "Estacionamento Arzamas", x = -429, y = 674, z = 12},
        {name = "Estacionamento Sul", x = 2215, y = -1969, z = 21},
    },
    ["4.Organizações governamentais"] = {
        {name = "Governo", x = -120, y = 788, z = 12},
        {name = "FSB", x = 524, y = 330, z = 12},
        {name = "Exército", x = 1901, y = 1730, z = 16},
        {name = "Ministério do Interior Arzamas", x = 141, y = 1265, z = 12},
        {name = "Polícia de Trânsito Sul", x = 2581, y = -2416, z = 22},
        {name = "Ministério de Situações de Emergência", x = 1811, y = 2091, z = 16},
        {name = "Hospital Arzamas", x = 405, y = 1762, z = 12},
        {name = "Hospital Sul", x = 2112, y = -2385, z = 23},
        {name = "RGT RK Ostankino", x = 2127, y = -1939, z = 21},
        {name = "TRK Ritmo", x = -308, y = 659, z = 12},
    },
    ["5.Estruturas criminais"] = {
             {name = "Grupo criminoso Tambov", x = 153, y = 447, z = 11},
             {name = "Picos de Boné", x = 2431, y = -1927, z = 22},
             {name = "Grupo criminoso Izmailovo ", x = 1798, y = 2195, z = 16},
             {name = "Caras de verdade", x = 385, y = 1955, z = 8},
             {name = "Covil", x = 1937, y = 2086, z = 16},
             {name = "Mercado negro", x = 2327, y = -246, z = 4},
             {name = "Prisão", x = -1717, y = -2820, z = 15}, 
    },
    ["6.Bancos"] = {
        {name = "Banco A", x = 361, y = 1367, z = 12},
        {name = "Banco Sul", x = 2376, y = -2140, z = 23},
        {name = "Banco B", x = 1850, y = 2037, z = 17}, 
        {name = "Banco L", x = -2081, y = 1928, z = 52},
        {name = "Casa da Moeda", x = -2585, y = 2835, z = 2},
    },
    ["7.Hotéis"] = {
        {name = "Hotel econômico", x = 179, y = 491, z = 13},
        {name = "Hotel de luxo", x = -220, y = 100, z = 13},
        {name = "Hotel médio", x = 2089, y = -2283, z = 25},
        {name = "Hotel econômico", x = -2249, y = 1999, z = 50},
    },
    ["8.Empresas de transporte"] = {
        {name = "TK Garel", x = 2199, y = -874, z = 14},
        {name = "TK Batyrevo", x = 1847, y = 2907, z = 13},
        {name = "TK Lytkarino", x = -2499, y = -78, z = 14},
    },
    ["9.Postos de Serviço"] = {
        {name = "Oficina", x = 2053, y = 1887, z = 16},
        {name = "Shinomontazh", x = 2182, y = -1836, z = 21},
        {name = "Staling Center", x = 397, y = 795, z = 12},
        {name = "Centro de tuning", x = -2, y = 639, z = 12},
    },
    ["10.Entretenimento"] = {
        {name = "Duelos", x = 1605, y = 1001, z = 14},
        {name = "Clube", x = 2555, y = -2204, z = 23},
        {name = "Cassino", x = 1458, y = 2641, z = 13},
        {name = "Zoológico", x = - 1776, y = 1283, z = 48},
        {name = "Centro de jogos", x = -2121, y = 2057, z = 51.0},
        {name = "Masmorra", x = -2685, y = 2768, z = 2},
        {name = "Batalha por contêineres (VCh)", x = 1994, y = 1399, z = 26},
        {name = "Batalha por contêineres (ZZ)", x = 339, y = -1903, z = 42},
        {name = "Leilão de contêineres", x = 802, y = 1796, z = 10},
        {name = "Reserva natural", x = -2520, y = -2257, z = 19},
        {name = "Píer (Pesca)", x = 2426, y = 231, z = 5},
    },
    ["11.Negócios"] = {
        ["1.АЗС"] = {
           {name = "Posto 7", x = -420, y = 925, z = 12},
           {name = "Posto 12", x = 755, y = 2562, z = 12},           
           {name = "Posto 16", x = 1994, y = 1927, z = 16},           
           {name = "Posto 22", x = 2296, y = -743, z = 13},           
           {name = "Posto 25", x = 2320, y = -1729, z = 23},           
           {name = "Posto 29", x = -588, y = -1894, z = 41},           
           {name = "Posto 33", x = -2689, y = 4, z = 11},
           {name = "Posto 52", x = 709, y = 780, z = 12},           
           {name = "Posto 58", x = -2770, y = 1886, z = 4},          
           {name = "Posto 61", x = -2445, y = 2785, z = 2},          
           {name = "Posto 73", x = 133, y = -1105, z = 41},
        }, 
        ["2.Lojas de roupas"] = {
           {name = "Loja de roupas 3", x = 203, y = 825, z = 13},
           {name = "Loja de roupas 19", x = 1859, y = 2250, z = 16},
           {name = "Loja de roupas 36", x = 2257, y = -2100, z = 22},
           {name = "Loja de roupas 45", x = -2088, y = 1853, z = 52},
        },
        ["3.Lojas de Acessórios"] = {
           {name = "Loja de acessórios 4", x = 218, y = 862, z = 14},  
           {name = "Loja de acessórios 37", x = 2409, y = -2143, z = 22},
           {name = "Loja de acessórios 76", x = 1945, y = 2065, z = 16},
           {name = "Loja de acessórios 77", x = -1991, y = 1645, z = 45},
        },
        ["4.Lojas de Armas"] = {
           {name = "Loja de armas 2", x = 209, y = 826, z = 13},
           {name = "Loja de armas 34", x = 2349, y = -2142, z = 22},
           {name = "Loja de armas 42", x = 1977, y = 1893, z = 16},
           {name = "Loja de armas 63", x = -2459, y = 2722, z = 2},
        },
        ["5.Lojas 24 horas por dia, 7 dias por semana"] = {
           {name = "Loja 24/7 1", x = 153, y = 776, z = 12},
           {name = "Loja 24/7 6", x = -421, y = 911, z = 12},
           {name = "Loja 24/7 8", x = -362, y = 1024, z = 13},
           {name = "Loja 24/7 9", x = 16, y = 917, z = 12},
           {name = "Loja 24/7 10", x = 305, y = 1666, z = 8},
           {name = "Loja 24/7 11", x = 750, y = 2572, z = 12},
           {name = "Loja 24/7 13", x = 1804, y = 2506, z = 16},
           {name = "Loja 24/7 15", x = 1994, y = 1937, z = 16},
           {name = "Loja 24/7 17", x = 1918, y = 2093, z = 16},
           {name = "Loja 24/7 18", x = 1854, y = 2245, z = 16},
           {name = "Loja 24/7 21", x = 2292, y = -734, z = 13},
           {name = "Loja 24/7 23", x = 2475, y = -729, z = 13},
           {name = "Loja 24/7 24", x = 2304, y = -1728, z = 23},
           {name = "Loja 24/7 28", x = -579, y = -1896, z = 41},
           {name = "Loja 24/7 30", x = -200, y = -1376, z = 41},
           {name = "Loja 24/7 32", x = 2698, y = 5, z = 11},
           {name = "Loja 24/7 35", x = 2258, y = -2106, z = 22},
           {name = "Loja 24/7 43", x = -2144, y = 2045, z = 50},
           {name = "Loja 24/7 49", x = 2281, y = -2377, z = 22},
           {name = "Loja 24/7 51", x = 700, y = 784, z = 12},
           {name = "Loja 24/7 59", x = -2765, y = 1896, z = 4},
           {name = "Loja 24/7 60", x = -2444, y = 2795, z = 2},
           {name = "Loja 24/7 69", x = -2117, y = -159, z = 27},
           {name = "Loja 24/7 72", x = 123, y = -1107, z = 41},
           {name = "Loja 24/7 75", x = -1727, y = -1234, z = 42},
        },
        ["6.Barras de Lanche"] = {
           {name = "Lanchonete 5", x = 174, y = 737, z = 12}, 
           {name = "Lanchonete 14", x = 1952, y = 1905, z = 15},
           {name = "Lanchonete 20", x = 1860, y = 2270, z = 15},
           {name = "Lanchonete 31", x = -379, y = -1824, z = 49},
           {name = "Lanchonete 44", x = -2065, y = 1984, z = 50},
           {name = "Lanchonete 53", x = 2307, y = -1911, z = 22},
           {name = "Lanchonete 68", x = -2445, y = 2722, z = 2},
           {name = "Lanchonete 74", x = -613.219788, y = -1293.424683, z = 47.567101},
        },
        ["7.Loja do Feiticeiro"] = {
                {name = "Loja do mago", x = -2651, y = 2837, z = 2},
        },
        ["8.Lojas de Eletrônicos"] = {
            {name = "DNS", x = 166, y = 719, z = 13},
            {name = "Eldorado", x = -2196, y = 1935, z = 50},
            {name = "DNS", x = 1919, y = 2042, z = 16},
        },
        ["9.Mercado Central"] = {
            {name = "Mercado central", x = -2535, y = 2757, z = 2},
        },
        ["10.Abrigo para animais de estimação"] = {
            {name = "Abrigo de animais", x = 322, y = 776, z = 12},
        },
        ["11.Loja do Pescador"] = {
            {name = "Loja de pesca", x = 2251, y = 1369, z = 12},
        },
        ["12.Lojas de mergulho"] = {
            {name = "Loja de mergulho Kit", x = -2043, y = 1104, z = 4},
            {name = "Loja de mergulho Concha", x = 2364, y = -2598, z = 23},
        }
    },
    ["12.Complexo de estufas"] = {
        {name = "Loja Jardim-Cidade", x = 1207, y = -574, z = 41},
        {name = "Loja de madeira", x = 2708, y = -1679, z = 23},
        {name = "Loja de vidro", x = 2322, y = 2031, z = 16},
        {name = "Loja de ferragens", x = -1372, y = 2648, z = 40},
        {name = "Loja atacadista Garel", x = 2219, y = -891, z = 14},
        {name = "Loja atacadista Batyrevo", x = 1867, y = 2891, z = 13},
        {name = "Loja atacadista Lytkarino", x = -2517, y = -62, z = 14},
    },
    ["13.Complexo Agrícola"] = {
       ["1.Ферма для сбора сена"] = {
         {name = "Chifres e penas", x = -1554, y = -1277, z = 42},   
         {name = "Chifres e cascos", x = 1381, y = 977, z = 13},
       },
       ["2.Anashan"] = {
         {name = "Auchan", x = 2451, y = -649, z = 13},
       },
       ["3.ZTaiga para coleção de madeira"] = {
                 {name = "Taiga para coleta de madeira", x = -2544, y = -2041, z = 19},
       },
       ["4.Fábrica de móveis"] = {
                 {name = "Fábrica de móveis", x = 2303, y = 2005, z = 16},
       }
    },
    ["14.Escritório da companhia aérea"] = {
         {name = "Escritório de companhias aéreas", x = -1098, y = -1641, z = 48},
    },
}
local teleportCategoryOrder = {
    "1.Funciona",
    "2.Locais públicos",
    "3.ZAutosalons",
    "4.Organizações governamentais",
    "5.Estruturas criminosas",
    "6.Bancos",
    "7.Hotéis",
    "8.Empresas de transporte",
    "9. Postos de Serviço",
    "10.Entretenimento",
    "11.Negócios",
    "12.Complexo de estufas",
    "13.Complexo agrícola",
    "14.Escritório da Companhia Aérea"
}

local savedPointsFile = "/sdcard/saved_points.lua"
local savedPoints = {}

function loadSavedPoints()
    local f = io.open(savedPointsFile, "r")
    if f then
        local content = f:read("*a")
        savedPoints = load("return " .. content)()
        f:close()
    end
end

function savePointsToFile()
    local f = io.open(savedPointsFile, "w")
    if f then
        f:write(serializeTable(savedPoints))
        f:close()
    end
end

function serializeTable(tbl)
    local str = "{\n"
    for k, v in pairs(tbl) do
        str = str .. string.format('["%s"] = {x = %f, y = %f, z = %f},\n', k, v.x, v.y, v.z)
    end
    str = str .. "}"
    return str
end

function findAndSaveCoords(noMenu)
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("4574729552438491892", gg.TYPE_QWORD)
    gg.refineNumber("4574729552438491892")
    local results = gg.getResults(3)

    if #results > 0 then
        local baseAddr = results[1].address
        
        local x_item = {
            address = baseAddr + (15 * 8), 
            flags = gg.TYPE_FLOAT, 
            value = 0,
            name = "y",
            freeze = false
        }
        
        local y_item = {
            address = baseAddr + (15.5 * 8), 
            flags = gg.TYPE_FLOAT, 
            value = 0,
            name = "z", 
            freeze = false
        }
        
        local z_item = {
            address = baseAddr + (14.5 * 8), 
            flags = gg.TYPE_FLOAT, 
            value = 0,
            name = "x",
            freeze = false
        }
        
        local current_values = gg.getValues({x_item, y_item, z_item})
        x_item.value = current_values[1].value
        y_item.value = current_values[2].value  
        z_item.value = current_values[3].value
        gg.addListItems({x_item, y_item, z_item})
        gg.toast("✅ Coordenadas salvas!")
        if noMenu then
            return
        else
            teleport()
        end
    else
        gg.toast("❌ Valor não encontrado")
        if not noMenu then
            teleport()
        end
    end

    gg.clearResults()
end

function teleportManual()
    findAndSaveCoords(true)
    local savedValues = gg.getListItems()
    if #savedValues >= 3 then
        local input = gg.prompt({"Digite X:", "Digite Y:", "Digite Z:"},
            {savedValues[1].value, savedValues[2].value, savedValues[3].value},
            {"number", "number", "number"})

        if input then
            savedValues[1].value = input[1]
            savedValues[2].value = input[2]
            savedValues[3].value = input[3]

            gg.setValues(savedValues)
            gg.toast("Teleporte concluído!")
            mainMenu()
        else
            gg.toast("Teleporte cancelado")
            teleport()
        end
    else
        gg.toast("❌ Erro: coordenadas salvas não encontradas!")
        teleport()
    end
end

function selectTeleportCategory()
    findAndSaveCoords(true)
    local categoryNames = teleportCategoryOrder

    local choice = gg.choice(categoryNames, nil, "Escolha a categoria")
    if choice then
        local selectedCategory = categoryNames[choice]

        if selectedCategory == "11.Бизнесы" or selectedCategory == "13.Фермерский комплекс" then
            local sortedSubcategories = {}

            
            for subcat, _ in pairs(teleportCategories[selectedCategory]) do
                table.insert(sortedSubcategories, subcat)
            end

            
            table.sort(sortedSubcategories, function(a, b)
                local numA = tonumber(a:match("^(%d+)"))  
                local numB = tonumber(b:match("^(%d+)"))  
                return numA < numB  
            end)

            local choiceSubcategory = gg.choice(sortedSubcategories, nil, "Escolha a subcategoria")
            if choiceSubcategory then
                local selectedSubcategory = sortedSubcategories[choiceSubcategory]
                selectTeleportLocation(selectedCategory, selectedSubcategory)
            else
                gg.toast("Você não escolheu uma subcategoria")
            end
        else
            selectTeleportLocation(selectedCategory)
        end
    else
        gg.toast("Você não escolheu uma categoria")
        teleport()
    end
end

function selectTeleportLocation(category, subcategory)
    local locations
    if subcategory then
        
        locations = teleportCategories[category][subcategory]
    else
        
        locations = teleportCategories[category]
    end

    local locationNames = {}
    for _, location in ipairs(locations) do
        table.insert(locationNames, location.name)
    end

    local choiceLocation = gg.choice(locationNames, nil, "Escolha a localização")
    if choiceLocation then
        local selectedLocation = locations[choiceLocation]
        teleportToLocation(selectedLocation)
    else
        gg.toast("Você não escolheu uma localização")
        teleport()
    end
end

function applyTeleport(x, y, z)
    local savedValues = gg.getListItems()
    if #savedValues >= 3 then
        savedValues[1].value = x
        savedValues[2].value = y
        savedValues[3].value = z
        gg.setValues(savedValues)
        gg.toast("Teleporte concluído!")
        mainMenu()
    else
        gg.toast("Erro: nenhuma coordenada salva")
        teleport()
    end
end
function userSavedPointsMenucar()
    
    local options = {"➕ Salvar ponto atual", "📌 Teleporte para ponto salvo", "⬅️ Voltar"}
    local choice = gg.choice(options, nil, "Pontos salvos")

    if choice == 1 then
        saveCurrentPoint()
    elseif choice == 2 then
        chooseSavedPoint()
    else
        teleportCar()
    end
end

function userSavedPointsMenu()
    findAndSaveCoords(true)
    local options = {"➕ Salvar ponto atual", "📌 Teleporte para ponto salvo", "⬅️ Voltar"}
    local choice = gg.choice(options, nil, "Pontos salvos")

    if choice == 1 then
        saveCurrentPoint()
    elseif choice == 2 then
        chooseSavedPoint()
    else
        teleport()
    end
end

function saveCurrentPoint()
    local values = gg.getListItems()
    if #values < 3 then
        gg.toast("Primeiro encontre as coordenadas")
        return teleport()
    end

    local input = gg.prompt({"Nome do ponto:"}, nil, {"text"})
    if input and input[1] ~= "" then
        savedPoints[input[1]] = {
            x = values[1].value,
            y = values[2].value,
            z = values[3].value
        }
        savePointsToFile()
        gg.toast("✅ Ponto salvo!")
    else
        gg.toast("❌ Salvamento cancelado")
    end
    teleport()
end

function chooseSavedPoint()
    loadSavedPoints()
    if next(savedPoints) == nil then
        gg.toast("Nenhum ponto salvo")
        return mainMenu()
    end

    local names = {}
    for name in pairs(savedPoints) do
        table.insert(names, name)
    end

    table.sort(names)
    local choice = gg.choice(names, nil, "Escolha um ponto")
    if choice then
        local point = savedPoints[names[choice]]
        applyTeleport(point.x, point.y, point.z)
    else
        gg.toast("Escolha cancelada")
        teleport()
    end
end

function cleanupOnExit()
    gg.removeListItems(gg.getListItems())
    gg.clearResults()
    gg.toast("Todos os dados salvos foram removidos!")
end

function teleportToLocation(location)
    local x = location.x
    local y = location.y
    local z = location.z

    local savedValues = gg.getListItems()
    if #savedValues >= 3 then
        savedValues[1].value = x
        savedValues[2].value = y
        savedValues[3].value = z
        gg.setValues(savedValues)

        gg.toast("Teleportando para " .. location.name .. " (X: " .. x .. ", Y: " .. y .. ", Z: " .. z .. ")")
        gg.sleep(1000)
        gg.toast("Teleporte concluído!")
        mainMenu()
    else
        gg.toast("Erro: nenhuma coordenada salva")
        teleport()
    end
end

--new

local isActive = false
local originalValues = {}
local customValue = 1000000.0

function nameTags()
    if isActive then
        if #originalValues > 0 then
            gg.setValues(originalValues)
            originalValues = {}
        end
        gg.toast("❌ Desativado")
        isActive = false
        return
    end

    local valueInput = gg.prompt({
        "💾 Digite o valor a definir:"
    }, {
        tostring(customValue)
    }, {"number"})

    if not valueInput then
        gg.toast("❌ Cancelado")
        return
    end
    customValue = tonumber(valueInput[1]) or customValue
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    gg.searchNumber("1.08978982e-41", gg.TYPE_FLOAT)
    local results = gg.getResults(10000)

    if #results == 0 then
        gg.toast("❌ Valor não encontrado")
        return
    end

    local offset = 1.5 * 8
    local modifications = {}
    originalValues = {}
    local changedCount = 0

    for i, result in ipairs(results) do
        local targetAddress = result.address + offset
        local targetData = gg.getValues({
            {address = targetAddress, flags = gg.TYPE_FLOAT}
        })[1]
        if targetData.value == 15 then
            table.insert(originalValues, {
                address = targetAddress,
                value = 15.0,
                flags = gg.TYPE_FLOAT
            })
            
            table.insert(modifications, {
                address = targetAddress,
                value = customValue,
                flags = gg.TYPE_FLOAT
            })
            changedCount = changedCount + 1
        end
    end

    if changedCount > 0 then
        gg.setValues(modifications)
        gg.toast("✅ Ativado")
        isActive = true
    else
        gg.toast("❌ Valor não encontrado")
        originalValues = {}
    end
end

local minePoints = {
    {x = -726.88, y = -2738.85, z = -24.92},   
    {x = -731.56, y = -2743.46, z = -25.17},   
    {x = -770.80, y = -2742.86, z = -22.25},   
    {x = -751.50, y = -2778.73, z = -19.90},
    {x = -756.84, y = -2779.91, z = -19.90},
    {x = -1446.21, y = 2580.12, z = 40.80},
}

function bot_main()
    gg.toast("Use este bot apenas com meu APK")
    findAndSaveCoords(true) 
    gg.sleep(500)
    local savedValues = gg.getListItems()
    
    if #savedValues < 3 then
        gg.toast("❌ Erro: não foi possível encontrar as coordenadas")
        return
    end
    local coords = {}
    for i, v in ipairs(savedValues) do
        if v.name == "x" then coords.x = v end
        if v.name == "y" then coords.y = v end  
        if v.name == "z" then coords.z = v end
    end
    
    if not (coords.x and coords.y and coords.z) then
        gg.toast("❌ Coordenadas não encontradas na lista do GG")
        return
    end
    
    gg.toast("✅ Bot da mina iniciado")
    
    local minePoint = 1
    
    while true do
        local point = minePoints[minePoint]
        coords.x.value = point.x
        coords.y.value = point.y  
        coords.z.value = point.z
        gg.setValues({coords.x, coords.y, coords.z})
        minePoint = minePoint + 1
        if minePoint > #minePoints then
            minePoint = 1
        end
        gg.sleep(5000)
        if gg.isVisible(true) then
            gg.setVisible(false)
            gg.toast("⛔ Bot da mina parado")
            break
        end
    end
end

function searchAndChangeHitboxes()
    local searchValue = 1042536202      -- исходное значение (DWORD)
    local changeValue = 7.333333        -- значение увеличения (FLOAT)
    local delay = 3000                  -- задержка в мс

    local input = gg.prompt(
        {
            "Valor para aumentar (FLOAT):",
            "Atraso em segundos:"
        },
        {
            tostring(changeValue),
            tostring(delay / 1000)
        },
        {
            "number",
            "number"
        }
    )

    if not input then
        gg.toast("❌ Cancelado")
        return
    end

    changeValue = tonumber(input[1]) or changeValue
    delay = (tonumber(input[2]) or 3) * 1000

    -- Android 14+: расширенный диапазон
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC)
    gg.setVisible(false)

    local fs_active = true
    local totalChanged = 0

    gg.toast("🔍 Procurando hitboxes...")

    while fs_active do
        gg.searchNumber(searchValue, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)

        local results = gg.getResults(200)
        if #results > 0 then
            for i, v in ipairs(results) do
                v.value = changeValue
                v.flags = gg.TYPE_FLOAT
            end

            gg.setValues(results)
            totalChanged = totalChanged + #results
        end

        gg.clearResults()
        gg.sleep(delay)

        if gg.isVisible() then
            gg.setVisible(false)

            local choice = gg.alert(
                "Hitbox Finder\n\n" ..
                "Valor atual: " .. changeValue .. "\n" ..
                "Endereços alterados: " .. totalChanged,
                "▶ Continuar",
                "✏ Alterar valor",
                "⛔ Parar"
            )

            if choice == 2 then
                local newInput = gg.prompt(
                    {"Novo valor (FLOAT):"},
                    {tostring(changeValue)},
                    {"number"}
                )
                if newInput then
                    changeValue = tonumber(newInput[1]) or changeValue
                    gg.toast("🔄 Novo valor: " .. changeValue)
                end
            elseif choice == 3 then
                fs_active = false
                gg.toast("🛑 Script parado")
            end
        end
    end
end

function searchAndChangeHitboxes3()
    local searchValue = 1042536202
    local changeValue = 7.333333
    local delay = 3000
    local input = gg.prompt({
        "Valor para aumentar:",
        "Atraso em segundos:"
    }, {
        tostring(changeValue),
        tostring(delay / 1000)
    }, {"number", "number"})
    
    if not input then
        gg.toast("❌ Cancelado")
        return
    end
    
    changeValue = tonumber(input[1]) or changeValue
    delay = (tonumber(input[2]) or 3) * 1000
    
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC)
    
    local fs_active = true
    local totalChanged = 0
    
    gg.toast("🔍 Procurando e substituindo por: " .. changeValue)
    
    while fs_active do
        gg.searchNumber(searchValue, gg.TYPE_DWORD)
        local results = gg.getResults(100)
        
        if #results > 0 then
            local changedCount = 0
            for i, v in ipairs(results) do
                if v.value == searchValue then
                    v.value = changeValue
                    v.flags = gg.TYPE_FLOAT
                    changedCount = changedCount + 1
                end
            end
            gg.setValues(results)
            totalChanged = totalChanged + changedCount
        end
        
        gg.clearResults()
        gg.sleep(delay)
        
        if gg.isVisible() then
            gg.setVisible(false)
            local choice = gg.alert(
                "Procurando hitboxes\n" ..
                "Aumento: " .. changeValue .. "\n" ..
                "Total aumentado: " .. totalChanged,
                "Continuar", 
                "Alterar aumento", 
                "Parar"
            )
            
            if choice == 2 then
                local newInput = gg.prompt({
                    "Novo valor para aumentar:"
                }, {tostring(changeValue)}, {"number"})
                if newInput then
                    changeValue = tonumber(newInput[1]) or changeValue
                    gg.toast("🔄 Novo valor: " .. changeValue)
                end
            elseif choice == 3 then
                fs_active = false
                gg.toast("🛑 Busca parada")
            end
        end
    end
end

function searchAndChangeHitboxes2()
    gg.clearResults()
    gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_C_DATA)
    
    local fs_active = true
    local searchValue = 1042536202
    local changeValue = 7.333333
    
    gg.toast("🔍 Busca por hitboxes iniciada...")
    
    while fs_active do
        gg.searchNumber(searchValue, gg.TYPE_DWORD)
        local results = gg.getResults(100)
        
        if #results > 0 then
            local changedCount = 0
            for i, v in ipairs(results) do
                if v.value == searchValue then
                    v.value = changeValue
                    v.flags = gg.TYPE_FLOAT
                    changedCount = changedCount + 1
                end
            end
            gg.setValues(results)
        end
        
        gg.clearResults()
        gg.sleep(3000)
        if gg.isVisible() then
            gg.setVisible(false)
            local choice = gg.alert("Busca por hitboxes", "Continuar", "Parar")
            if choice == 2 then
                fs_active = false
                gg.toast("🛑 Busca por hitboxes parada")
            end
        end
    end
end

local fs_active = false
local ORIGINAL = "4539628425391341620"
local BOOSTED  = "4539628427538825268"

function FastScooterToggle()
    gg.clearResults()
    gg.setVisible(false)
    gg.setRanges(bit32.bor(gg.REGION_C_ALLOC, gg.REGION_OTHER))

    if not fs_active then
        gg.searchNumber(ORIGINAL, gg.TYPE_QWORD)
        local r = gg.getResults(10)

        if #r == 0 then
            gg.toast("❌ Valor não encontrado")
            return
        end

        gg.editAll(BOOSTED, gg.TYPE_QWORD)
        gg.clearResults()

        fs_active = true
        gg.toast("✅ Ativado")

    else
        gg.searchNumber(BOOSTED, gg.TYPE_QWORD)
        local r = gg.getResults(10)

        if #r == 0 then
            gg.toast("⚠️ Valor não encontrado")
        end

        gg.editAll(ORIGINAL, gg.TYPE_QWORD)
        gg.clearResults()

        fs_active = false
        gg.toast("❌ Desativado")
    end
end

--бот нефте
local mainPoint = { -803.948120, 779.632568, 13.102301 }
local sidePoints = {
    { -789.562561, 779.015381, 13.102301 },
    { -806.212463, 790.878296, 13.102301 },
    { -789.562256, 785.196472, 13.102301 },
}

local steps = 350
local delay = 10


function bot_Neftezavod()
    math.randomseed(os.time())
    findAndSaveCoords(true) 
    local list = gg.getListItems()
    local tbl  = {}
    for _, v in ipairs(list) do
        if     v.name == "x" then tbl[1] = v
        elseif v.name == "y" then tbl[2] = v
        elseif v.name == "z" then tbl[3] = v
        end
    end
    if #tbl ~= 3 then
        print("❌ x/y/z não encontrados na lista")
        return
    end
    while true do
        gotoPoint(tbl, mainPoint)
        gg.toast("Ponto alcançado – CD 5s")
        gg.sleep(5000)
        local randomIdx = math.random(1, #sidePoints)
        local target    = sidePoints[randomIdx]
        gotoPoint(tbl, target)
        gg.toast("Ponto alcançado – CD 2s")
        gg.sleep(2000)
    end
end

function gotoPoint(tbl, point)
    local tx, ty, tz = point[1], point[2], point[3]
    local sx, sy, sz = tbl[1].value, tbl[2].value, tbl[3].value

    local dx = (tx - sx) / steps
    local dy = (ty - sy) / steps
    local dz = (tz - sz) / steps

    for i = 1, steps do
        tbl[1].value = sx + dx * i
        tbl[2].value = sy + dy * i
        tbl[3].value = sz + dz * i
        gg.setValues(tbl)
        gg.sleep(delay)
    end
end

--бот завола
local mainPoint2 = { 660.644165, 1312.790894, 1746.433960 }
local sidePoints2 = {
    { 647.613525, 1313.033325, 1746.433960 },
    { 647.672913, 1310.464478, 1746.433960 },
    { 647.493164, 1308.049683, 1746.433960 },
}

local steps2 = 350
local delay2 = 10

function bot_factory()
    math.randomseed(os.time())
    findAndSaveCoords(true) 
    local list2 = gg.getListItems()
    local tbl2  = {}
    for _, v in ipairs(list2) do
        if     v.name == "x" then tbl2[1] = v
        elseif v.name == "y" then tbl2[2] = v
        elseif v.name == "z" then tbl2[3] = v
        end
    end
    if #tbl2 ~= 3 then
        print("❌ x/y/z não encontrados na lista")
        return
    end
    while true do
        gotoPoint2(tbl2, mainPoint2)
        gg.toast("Ponto alcançado – CD 2s")
        gg.sleep(2000)
        local randomIdx2 = math.random(1, #sidePoints2)
        local target2    = sidePoints2[randomIdx2]
        gotoPoint2(tbl2, target2)
        gg.toast("Ponto alcançado – CD 5s")
        gg.sleep(5000)
    end
end

function gotoPoint2(tbl2, point2)
    local tx2, ty2, tz2 = point2[1], point2[2], point2[3]
    local sx2, sy2, sz2 = tbl2[1].value, tbl2[2].value, tbl2[3].value

    local dx2 = (tx2 - sx2) / steps2
    local dy2 = (ty2 - sy2) / steps2
    local dz2 = (tz2 - sz2) / steps2

    for i = 1, steps2 do
        tbl2[1].value = sx2 + dx2 * i
        tbl2[2].value = sy2 + dy2 * i
        tbl2[3].value = sz2 + dz2 * i
        gg.setValues(tbl2)
        gg.sleep(delay2)
    end
end

--бот леса
local mainPoint3 =  { 2691.738037, -1750.477905, 23.279127 }
local sidePoints3 = {
    { 2698.947998, -1723.269775, 23.338751 }
}

local steps3 = 350
local delay3 = 10

function bot_forest()
    math.randomseed(os.time())
    findAndSaveCoords(true) 
    local list3 = gg.getListItems()
    local tbl3  = {}
    for _, v in ipairs(list3) do
        if     v.name == "x" then tbl3[1] = v
        elseif v.name == "y" then tbl3[2] = v
        elseif v.name == "z" then tbl3[3] = v
        end
    end
    if #tbl3 ~= 3 then
        print("❌ x/y/z não encontrados na lista")
        return
    end
    while true do
        gotoPoint3(tbl3, mainPoint3)
        gg.toast("Ponto alcançado – CD 5s")
        gg.sleep(5000)
        local randomIdx3 = math.random(1, #sidePoints3)
        local target3    = sidePoints3[randomIdx3]
        gotoPoint3(tbl3, target3)
        gg.toast("Ponto alcançado – CD 2s")
        gg.sleep(2000)
    end
end

function gotoPoint3(tbl3, point3)
    local tx3, ty3, tz3 = point3[1], point3[2], point3[3]
    local sx3, sy3, sz3 = tbl3[1].value, tbl3[2].value, tbl3[3].value

    local dx3 = (tx3 - sx3) / steps3
    local dy3 = (ty3 - sy3) / steps3
    local dz3 = (tz3 - sz3) / steps3

    for i = 1, steps3 do
        tbl3[1].value = sx3 + dx3 * i
        tbl3[2].value = sy3 + dy3 * i
        tbl3[3].value = sz3 + dz3 * i
        gg.setValues(tbl3)
        gg.sleep(delay3)
    end
end

----------------------------------
-- НАСТРОЙКИ
----------------------------------
local QWORD_TO_FIND = "4568905975200743424"
local REGION = gg.REGION_C_ALLOC
local FLOAT_MIN, FLOAT_MAX = 1.0, 3000.0
local WINDOW_BYTES = 0x30D40
local TOLERANCE = 0.45

----------------------------------
-- КООРДИНАТЫ ИГРОКА ИЗ СПИСКА
----------------------------------
function getPlayerCoordsFromList()
    findAndSaveCoords(true)

    local list = gg.getListItems()
    local px, py, pz

    for i = 1, #list do
        if list[i].name == "x" then px = list[i].value end
        if list[i].name == "y" then py = list[i].value end
        if list[i].name == "z" then pz = list[i].value end
    end

    if not px or not py or not pz then
        gg.alert("❌ Primeiro salve as coordenadas do jogador")
        return nil
    end

    return px, py, pz
end

----------------------------------
-- УДАЛЕНИЕ КООРДИНАТ ИГРОКА
----------------------------------
function removePlayerCoordsFromList()
    local list = gg.getListItems()
    local toRemove = {}

    for i = 1, #list do
        if list[i].name == "x" or
           list[i].name == "y" or
           list[i].name == "z" then
            table.insert(toRemove, list[i])
        end
    end

    if #toRemove > 0 then
        gg.removeListItems(toRemove)
    end
end

----------------------------------
-- ПОЛНАЯ ОЧИСТКА СОХРАНЁНКИ
----------------------------------
function clearSavedList()
    local list = gg.getListItems()
    if #list > 0 then
        gg.removeListItems(list)
    end
end

----------------------------------
-- ПОИСК КООРДИНАТ МАШИНЫ
----------------------------------
function findCarCoords()
    clearSavedList()
    local px, py, pz = getPlayerCoordsFromList()
    if not px then return end

    gg.clearResults()
    gg.setRanges(REGION)

    -- 1️⃣ сигнатура машины
    gg.searchNumber(QWORD_TO_FIND, gg.TYPE_QWORD)
    local qres = gg.getResults(10000000)

    if #qres == 0 then
        gg.alert("❌ Assinatura do carro não encontrada")
        return
    end

    local candidates = {}

    -- 2️⃣ сбор похожих FLOAT
    for i = 1, #qres do
        local startA = qres[i].address
        local endA = startA + WINDOW_BYTES

        gg.searchNumber(
            FLOAT_MIN .. "~" .. FLOAT_MAX,
            gg.TYPE_FLOAT,
            false,
            gg.SIGN_EQUAL,
            startA,
            endA
        )

        local part = gg.getResults(50000000)

        for j = 1, #part do
            local v = part[j].value
            if math.abs(v - px) <= TOLERANCE or
               math.abs(v - py) <= TOLERANCE or
               math.abs(v - pz) <= TOLERANCE then
                candidates[#candidates + 1] = part[j]
            end
        end

        gg.clearResults()
    end

    if #candidates == 0 then
        gg.alert("❌ Coordenadas semelhantes não encontradas")
        return
    end

    ----------------------------------
    -- 3️⃣ ПРОПУСК ПЕРВОЙ ТРОЙКИ
    ----------------------------------
    local foundCount = 0

    for i = 1, #candidates do
        local a = candidates[i].address

        local vals = gg.getValues({
            {address = a, flags = gg.TYPE_FLOAT},
            {address = a + 4, flags = gg.TYPE_FLOAT},
            {address = a + 8, flags = gg.TYPE_FLOAT}
        })

        if vals[1] and vals[2] and vals[3] then
            if math.abs(vals[1].value - px) <= TOLERANCE and
               math.abs(vals[2].value - py) <= TOLERANCE and
               math.abs(vals[3].value - pz) <= TOLERANCE then

                foundCount = foundCount + 1

                -- ⛔ первая тройка — игрок
                if foundCount == 1 then
                    -- пропуск
                elseif foundCount == 2 then
                    -- ✅ машина
                    vals[1].name = "Car_X"
                    vals[2].name = "Car_Y"
                    vals[3].name = "Car_Z"

                    gg.addListItems(vals)

                    -- 🧹 УДАЛЯЕМ координаты игрока
                    removePlayerCoordsFromList()

                    gg.toast("✅ Coordenadas do carro salvas, coordenadas do jogador removidas")
                    return
                end
            end
        end
    end

    gg.alert("❌ Encontrado apenas um trio (apenas jogador)")
end








local QWORD_TO_FIND = "4568905975200743424"
local REGION = gg.REGION_C_ALLOC
local FLOAT_MIN, FLOAT_MAX = 1.000001, 150.0
local MAX_CANDIDATES = 5000000
local WINDOW_BYTES = 0x30D40

-- Утилиты
function copyTable(list)
    local r = {}
    for i = 1, #list do
        r[i] = {address = list[i].address, flags = list[i].flags, value = list[i].value}
    end
    return r
end

function valuesMap(list)
    local m = {}
    for i = 1, #list do m[list[i].address] = list[i].value end
    return m
end

function filterByDirection(prevList, nextList, wantUp)
    local prev = valuesMap(prevList)
    local out = {}
    for i = 1, #nextList do
        local a = nextList[i].address
        local v0 = prev[a]
        local v1 = nextList[i].value
        if v0 ~= nil then
            if wantUp and v1 > v0 then
                out[#out + 1] = {address = a, flags = gg.TYPE_FLOAT, value = v1}
            elseif (not wantUp) and v1 < v0 then
                out[#out + 1] = {address = a, flags = gg.TYPE_FLOAT, value = v1}
            end
        end
    end
    return out
end

function dedupByAddress(list)
    local seen, out = {}, {}
    for i = 1, #list do
        local a = list[i].address
        if not seen[a] then
            seen[a] = true
            out[#out + 1] = list[i]
        end
    end
    return out
end

-- 🔍 Шаг 1: Поиск кандидатов
function findCoords()
    gg.clearResults()
    gg.setRanges(REGION)
    gg.searchNumber(QWORD_TO_FIND, gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
    local qres = gg.getResults(1000000)

    if #qres == 0 then
        gg.alert("❌ Carro não encontrado pela assinatura")
        return nil
    end

    local candidates = {}
    for i = 1, #qres do
        local startA = qres[i].address
        local endA = startA + WINDOW_BYTES
        gg.searchNumber(FLOAT_MIN .. "~" .. FLOAT_MAX, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, startA, endA)
        local part = gg.getResults(1000000)
        for j = 1, #part do
            part[j].flags = gg.TYPE_FLOAT
            candidates[#candidates + 1] = part[j]
            if #candidates >= MAX_CANDIDATES then
                break
            end
        end
        if #candidates >= MAX_CANDIDATES then break end
    end

    candidates = dedupByAddress(candidates)
    gg.clearResults()
    return candidates
end

-- 🔍 Шаг 2: Фильтрация по движению
function twoChecks(candidates)
    local before1 = gg.getValues(copyTable(candidates))
    gg.toast("🚗 Aguarde... vá para cima ou para baixo")
    gg.sleep(5000)
    local dir1 = gg.choice({"Subiu", "Desceu"}, nil, "Para onde você se moveu?")
    if not dir1 then return nil end
    local wantUp1 = (dir1 == 1)
    local after1 = gg.getValues(copyTable(candidates))
    local filtered1 = filterByDirection(before1, after1, wantUp1)
    if #filtered1 == 0 then return nil end

    local before2 = gg.getValues(copyTable(filtered1))
    gg.toast("🚗 Repita o movimento...")
    gg.sleep(5000)
    local dir2 = gg.choice({"Subiu", "Desceu"}, nil, "Para onde você se moveu? (novamente)")
    if not dir2 then return nil end
    local wantUp2 = (dir2 == 1)
    local after2 = gg.getValues(copyTable(filtered1))
    local filtered2 = filterByDirection(before2, after2, wantUp2)
    if #filtered2 == 0 then return nil end

    return filtered2
end

local function processValues(list)
    local index = 1
    while index <= #list do
        local batch = {}
        for i = index, math.min(index + 9, #list) do
            batch[#batch + 1] = list[i]
        end

        for i, item in ipairs(batch) do
            item.value = item.value + 10
            gg.setValues({item})
            gg.toast("Opção: #" .. i .. " de " .. #batch)
            gg.sleep(2000)
        end

        local menu = {}
        for i = 1, #batch do
            menu[#menu + 1] = "Escolher opção #" .. i
        end
        menu[#menu + 1] = "Próximo"

        local choice = gg.choice(menu, nil, "Escolha uma opção ou 'Próximo'")
        if not choice then return end

        if choice <= #batch then
            local sel = batch[choice]
            local toSave = {}
            toSave[1] = sel
            toSave[2] = {address = sel.address - 0x4, flags = gg.TYPE_FLOAT}
            toSave[3] = {address = sel.address - 0x8, flags = gg.TYPE_FLOAT}
            toSave = gg.getValues(toSave)
            if toSave[1] then toSave[1].name = "Car_X" end
            if toSave[2] then toSave[2].name = "Car_Y" end
            if toSave[3] then toSave[3].name = "Car_Z" end
            gg.addListItems(toSave)
            return
        else
            index = index + 10
        end
    end
    gg.alert("As coordenadas acabaram ❌")
end

-- Pré‑carregamento dos endereços das novas funções
carregarTudo()

while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        mainMenu()
    end
    gg.sleep(100)
end
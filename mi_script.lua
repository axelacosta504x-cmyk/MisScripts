-- ==============================================================================
-- ⚡ AXEL SVK HUB + MULTILANGUAGE (TABS DESIGN) v36 (ROBA UN HUEVO FIXED) ⚡
-- ==============================================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Camera = Workspace.CurrentCamera
local localPlayer = Players.LocalPlayer

-- Limpieza previa
pcall(function()
    if CoreGui:FindFirstChild("AxelSvkHubGui") then
        CoreGui.AxelSvkHubGui:Destroy()
    end
end)

local RootGui = Instance.new("ScreenGui")
RootGui.Name = "AxelSvkHubGui"
RootGui.ResetOnSpawn = false
RootGui.Parent = CoreGui

-- ==========================================
-- 1. PANTALLA DE CARGA (CON IMAGEN CENTRAL)
-- ==========================================
local LoadingFrame = Instance.new("Frame", RootGui)
LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 8)
LoadingFrame.ZIndex = 100

local LoadTitle = Instance.new("TextLabel", LoadingFrame)
LoadTitle.Size = UDim2.new(0, 450, 0, 80)
LoadTitle.Position = UDim2.new(0.5, -225, 0.10, 0)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "AXEL SVK"
LoadTitle.TextColor3 = Color3.fromRGB(50, 255, 80)
LoadTitle.TextSize = 48
LoadTitle.Font = Enum.Font.GothamBlack
LoadTitle.ZIndex = 105

local TitleStroke = Instance.new("UIStroke", LoadTitle)
TitleStroke.Color = Color3.fromRGB(255, 30, 40)
TitleStroke.Thickness = 3

local LoadStatus = Instance.new("TextLabel", LoadingFrame)
LoadStatus.Size = UDim2.new(0, 400, 0, 25)
LoadStatus.Position = UDim2.new(0.5, -200, 0.24, 0)
LoadStatus.BackgroundTransparency = 1
LoadStatus.Text = "[ INICIANDO SECUENCIA ]"
LoadStatus.TextColor3 = Color3.fromRGB(255, 40, 50)
LoadStatus.TextSize = 13
LoadStatus.Font = Enum.Font.Code
LoadStatus.ZIndex = 105

local BarBg = Instance.new("Frame", LoadingFrame)
BarBg.Size = UDim2.new(0, 380, 0, 4)
BarBg.Position = UDim2.new(0.5, -190, 0.31, 0)
BarBg.BackgroundColor3 = Color3.fromRGB(40, 10, 15)
BarBg.ZIndex = 105
Instance.new("UICorner", BarBg).CornerRadius = UDim.new(1, 0)

local BarFill = Instance.new("Frame", BarBg)
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(255, 30, 40)
BarFill.ZIndex = 106
Instance.new("UICorner", BarFill).CornerRadius = UDim.new(1, 0)

local PercentText = Instance.new("TextLabel", LoadingFrame)
PercentText.Size = UDim2.new(0, 100, 0, 25)
PercentText.Position = UDim2.new(0.5, -50, 0.34, 0)
PercentText.BackgroundTransparency = 1
PercentText.Text = "0%"
PercentText.TextColor3 = Color3.fromRGB(255, 50, 60)
PercentText.TextSize = 16
PercentText.Font = Enum.Font.GothamBold
PercentText.ZIndex = 105

local LogBox = Instance.new("Frame", LoadingFrame)
LogBox.Size = UDim2.new(0, 380, 0, 75)
LogBox.Position = UDim2.new(0.5, -190, 0.41, 0)
LogBox.BackgroundColor3 = Color3.fromRGB(8, 6, 10)
LogBox.ZIndex = 105
Instance.new("UICorner", LogBox).CornerRadius = UDim.new(0, 6)

local LogStroke = Instance.new("UIStroke", LogBox)
LogStroke.Color = Color3.fromRGB(200, 30, 40)
LogStroke.Thickness = 1.2

local LogText = Instance.new("TextLabel", LogBox)
LogText.Size = UDim2.new(1, -16, 1, -10)
LogText.Position = UDim2.new(0, 8, 0, 8)
LogText.BackgroundTransparency = 1
LogText.Text = "> system.boot()\n> modules.load()"
LogText.TextColor3 = Color3.fromRGB(160, 120, 130)
LogText.TextSize = 10
LogText.Font = Enum.Font.Code
LogText.TextXAlignment = Enum.TextXAlignment.Left
LogText.TextYAlignment = Enum.TextYAlignment.Top
LogText.ZIndex = 106

local BottomImgBox = Instance.new("Frame", LoadingFrame)
BottomImgBox.Size = UDim2.new(0, 85, 0, 85)
BottomImgBox.Position = UDim2.new(0.5, -42, 0.55, 0)
BottomImgBox.BackgroundColor3 = Color3.fromRGB(8, 6, 10)
BottomImgBox.ZIndex = 105
Instance.new("UICorner", BottomImgBox).CornerRadius = UDim.new(0, 8)
local ImgBoxStroke = Instance.new("UIStroke", BottomImgBox)
ImgBoxStroke.Color = Color3.fromRGB(200, 30, 40)
ImgBoxStroke.Thickness = 1.2

local CenterImg = Instance.new("ImageLabel", BottomImgBox)
CenterImg.Size = UDim2.new(1, -8, 1, -8)
CenterImg.Position = UDim2.new(0, 4, 0, 4)
CenterImg.BackgroundTransparency = 1
CenterImg.Image = "rbxassetid://6023426915"
CenterImg.ZIndex = 106
Instance.new("UICorner", CenterImg).CornerRadius = UDim.new(0, 6)

-- ==========================================
-- 2. DICCIONARIO DE IDIOMAS
-- ==========================================
local currentLang = "es"

local Translations = {
    es = {
        title = "⚡ AXEL SVK HUB",
        tabMain = "Principal", tabCombat = "Combate", tabMove = "Movimiento", tabAudio = "Música", tabEmotes = "Animaciones", tabRoba = "Roba un Huevo", tabUtils = "Utilidades",
        secMainTitle = "Panel Principal", secCombatTitle = "Aimbot & ESP", secMoveTitle = "Utilidades de Movimiento", secAudioTitle = "Radio & Volumen", secEmotesTitle = "Gestor de Emotes", secRobaTitle = "Roba un Huevo (Anti-Kick Panel)", secUtilsTitle = "Utilidades & Servidor",
        radio = "🎵 Radio AXEL (Funk ID)", vol = "Volumen Música: ", fullbright = "Brillo Máximo (FullBright)", aimbot = "Aimbot por FOV", teamcheck = "Team Check (No amigos)", fovshow = "Mostrar Círculo FOV", esp = "Ver Jugadores x Paredes (ESP)", hitbox = "Hitbox Expander", hitboxSizeLabel = "Tamaño Hitbox: ", hitboxColorLabel = "Color Hitbox: ", wallhop = "Wallhop V3 (Pro Script)", noclip = "Noclip (Atravesar paredes)", invisibility = "Invisibilidad", dupe = "Duplicar Objeto (Multi-Juego)", emotebtn = "🕺 Abrir Emote GUI Oficial",
        robaBypass = "Bypass Anti cheat (Safe)", robaStand = "Move to Stand", robaRespawn = "Respawn Character", robaTpWalk = "TP Walk (Anti-Rollback): ", robaSpeedLabel = "TP Speed: ",
        saveConfig = "💾 Guardar Configuración", rejoinBtn = "🔄 Reconectar (Rejoin)", serverHopBtn = "🌐 Cambiar de Servidor (Hop)", emptyServerBtn = "👻 Buscar Servidor Vacío (Solo)", tpPlayerTitle = "Teletransporte a Jugador: ",
        notifFunkOn = "¡Sonando Funk!", notifFunkOff = "Música apagada.", notifVol = "Volumen cambiado a ", notifOpenEmote = "Abriendo Emote GUI...", notifWallhop = "¡Wallhop V3 activado!", notifSaved = "¡Configuración guardada con éxito!", notifRejoin = "Reconectando al servidor...", notifHop = "Buscando otro servidor...", notifEmpty = "Buscando servidor vacío...", notifEmptyNotFound = "No se encontró vacío, reintentando...", notifTp = "Teletransportado a: ", loaded = "¡AXEL SVK Hub v36 cargado con éxito!"
    },
    en = {
        title = "⚡ AXEL SVK HUB",
        tabMain = "Main", tabCombat = "Combat", tabMove = "Movement", tabAudio = "Audio", tabEmotes = "Emotes", tabRoba = "Steal an Egg", tabUtils = "Utilities",
        secMainTitle = "Main Panel", secCombatTitle = "Aimbot & ESP", secMoveTitle = "Movement Utilities", secAudioTitle = "Radio & Volume", secEmotesTitle = "Emotes Manager", secRobaTitle = "Steal an Egg (Anti-Kick Panel)", secUtilsTitle = "Utilities & Server",
        radio = "🎵 AXEL Radio (Funk ID)", vol = "Music Volume: ", fullbright = "FullBright", aimbot = "FOV Aimbot", teamcheck = "Team Check", fovshow = "Show FOV Circle", esp = "Wall ESP", hitbox = "Hitbox Expander", hitboxSizeLabel = "Hitbox Size: ", hitboxColorLabel = "Hitbox Color: ", wallhop = "Wallhop V3 (Pro Script)", noclip = "Noclip", invisibility = "Invisibility", dupe = "Duplicate Object (Multi-Game)", emotebtn = "🕺 Open Official Emote GUI",
        robaBypass = "Bypass Anti cheat (Safe)", robaStand = "Move to Stand", robaRespawn = "Respawn Character", robaTpWalk = "TP Walk (Anti-Rollback): ", robaSpeedLabel = "TP Speed: ",
        saveConfig = "💾 Save Configuration", rejoinBtn = "🔄 Rejoin Server", serverHopBtn = "🌐 Server Hop", emptyServerBtn = "👻 Empty Server (Solo)", tpPlayerTitle = "Teleport to Player: ",
        notifFunkOn = "Funk Playing!", notifFunkOff = "Music turned off.", notifVol = "Volume changed to ", notifOpenEmote = "Opening Emote GUI...", notifWallhop = "Wallhop V3 enabled!", notifSaved = "Configuration saved successfully!", notifRejoin = "Rejoining server...", notifHop = "Searching another server...", notifEmpty = "Searching empty server...", notifEmptyNotFound = "None empty found, retrying...", notifTp = "Teleported to: ", loaded = "AXEL SVK Hub v36 loaded successfully!"
    },
    pt = {
        title = "⚡ AXEL SVK HUB",
        tabMain = "Principal", tabCombat = "Combate", tabMove = "Movimento", tabAudio = "Áudio", tabEmotes = "Emotes", tabRoba = "Roba un Huevo", tabUtils = "Utilitários",
        secMainTitle = "Painel Principal", secCombatTitle = "Aimbot & ESP", secMoveTitle = "Utilidades de Movimento", secAudioTitle = "Rádio & Volume", secEmotesTitle = "Gerenciador de Emotes", secRobaTitle = "Roba un Huevo (Anti-Kick)", secUtilsTitle = "Utilitários & Servidor",
        radio = "🎵 Rádio AXEL (Funk ID)", vol = "Volume da Música: ", fullbright = "Brilho Máximo (FullBright)", aimbot = "Aimbot por FOV", teamcheck = "Team Check (Sem amigos)", fovshow = "Mostrar Círculo FOV", esp = "Ver Jogadores por Paredes (ESP)", hitbox = "Hitbox Expander", hitboxSizeLabel = "Tamanho do Hitbox: ", hitboxColorLabel = "Cor do Hitbox: ", wallhop = "Wallhop V3 (Pro Script)", noclip = "Noclip (Atravessar paredes)", invisibility = "Invisibilidade", dupe = "Duplicar Objeto (Multi-Jogo)", emotebtn = "🕺 Abrir Emote GUI Oficial",
        robaBypass = "Bypass Anti cheat (Safe)", robaStand = "Move to Stand", robaRespawn = "Respawn Character", robaTpWalk = "TP Walk (Anti-Rollback): ", robaSpeedLabel = "TP Speed: ",
        saveConfig = "💾 Salvar Configuração", rejoinBtn = "🔄 Reconectar (Rejoin)", serverHopBtn = "🌐 Trocar de Servidor (Hop)", emptyServerBtn = "👻 Servidor Vazio (Sozinho)", tpPlayerTitle = "Teleportar para Jogador: ",
        notifFunkOn = "Tocando Funk!", notifFunkOff = "Música desligada.", notifVol = "Volume alterado para ", notifOpenEmote = "Abrindo Emote GUI...", notifWallhop = "Wallhop V3 ativado!", notifSaved = "Configuração salva com sucesso!", notifRejoin = "Reconectando ao servidor...", notifHop = "Procurando outro servidor...", notifEmpty = "Procurando servidor vazio...", notifEmptyNotFound = "Nenhum vazio, tentando outro...", notifTp = "Teletransportado para: ", loaded = "AXEL SVK Hub v36 carregado com sucesso!"
    },
    fr = {
        title = "⚡ AXEL SVK HUB",
        tabMain = "Principal", tabCombat = "Combat", tabMove = "Mouvement", tabAudio = "Audio", tabEmotes = "Emotes", tabRoba = "Roba un Huevo", tabUtils = "Utilitaires",
        secMainTitle = "Panneau Principal", secCombatTitle = "Aimbot & ESP", secMoveTitle = "Utilitaires de Mouvement", secAudioTitle = "Radio & Volume", secEmotesTitle = "Gestionnaire d'Emotes", secRobaTitle = "Roba un Huevo (Anti-Kick)", secUtilsTitle = "Utilitaires & Serveur",
        radio = "🎵 Radio AXEL (Funk ID)", vol = "Volume de la musique : ", fullbright = "Pleine Luminosité (FullBright)", aimbot = "Aimbot par FOV", teamcheck = "Vérification d'équipe", fovshow = "Afficher le cercle FOV", esp = "ESP à travers les murs", hitbox = "Hitbox Expander", hitboxSizeLabel = "Taille de Hitbox : ", hitboxColorLabel = "Couleur de Hitbox : ", wallhop = "Wallhop V3 (Pro Script)", noclip = "Noclip (Traverser les murs)", invisibility = "Invisibilité", dupe = "Dupliquer l'objet", emotebtn = "🕺 Ouvrir l'Emote GUI Officiel",
        robaBypass = "Bypass Anti cheat (Safe)", robaStand = "Move to Stand", robaRespawn = "Respawn Character", robaTpWalk = "TP Walk (Anti-Rollback): ", robaSpeedLabel = "TP Speed: ",
        saveConfig = "💾 Enregistrer la configuration", rejoinBtn = "🔄 Rejoindre à nouveau (Rejoin)", serverHopBtn = "🌐 Changer de serveur (Hop)", emptyServerBtn = "👻 Serveur Vide (Seul)", tpPlayerTitle = "Se téléporter au joueur : ",
        notifFunkOn = "Funk en cours !", notifFunkOff = "Musique coupée.", notifVol = "Volume changé à ", notifOpenEmote = "Ouverture de l'Emote GUI...", notifWallhop = "Wallhop V3 activé !", notifSaved = "Configuration enregistrée avec succès !", notifRejoin = "Reconnexion au serveur...", notifHop = "Recherche d'un autre serveur...", notifEmpty = "Recherche serveur vide...", notifEmptyNotFound = "Aucun vide trouvé...", notifTp = "Téléporté vers : ", loaded = "AXEL SVK Hub v36 chargé avec succès !"
    },
    de = {
        title = "⚡ AXEL SVK HUB",
        tabMain = "Haupt", tabCombat = "Kampf", tabMove = "Bewegung", tabAudio = "Audio", tabEmotes = "Emotes", tabRoba = "Roba un Huevo", tabUtils = "Dienstprogramme",
        secMainTitle = "Hauptpanel", secCombatTitle = "Aimbot & ESP", secMoveTitle = "Bewegungs-Tools", secAudioTitle = "Radio & Lautstärke", secEmotesTitle = "Emote-Manager", secRobaTitle = "Roba un Huevo (Anti-Kick)", secUtilsTitle = "Tools & Server",
        radio = "🎵 AXEL Radio (Funk ID)", vol = "Musiklautstärke: ", fullbright = "Vollbeleuchtung (FullBright)", aimbot = "FOV Aimbot", teamcheck = "Team Check (Keine Freunde)", fovshow = "FOV-Kreis anzeigen", esp = "Wand ESP", hitbox = "Hitbox Expander", hitboxSizeLabel = "Hitbox-Größe: ", hitboxColorLabel = "Hitbox-Farbe: ", wallhop = "Wallhop V3 (Pro Script)", noclip = "Noclip (Durch Wände gehen)", invisibility = "Unsichtbarkeit", dupe = "Objekt duplizieren", emotebtn = "🕺 Offizielles Emote GUI öffnen",
        robaBypass = "Bypass Anti cheat (Safe)", robaStand = "Move to Stand", robaRespawn = "Respawn Character", robaTpWalk = "TP Walk (Anti-Rollback): ", robaSpeedLabel = "TP Speed: ",
        saveConfig = "💾 Konfiguration speichern", rejoinBtn = "🔄 Neu verbinden (Rejoin)", serverHopBtn = "🌐 Server wechseln (Hop)", emptyServerBtn = "👻 Leerer Server (Allein)", tpPlayerTitle = "Zu Spieler teleportieren: ",
        notifFunkOn = "Funk spielt!", notifFunkOff = "Musik ausgeschaltet.", notifVol = "Lautstärke geändert zu ", notifOpenEmote = "Emote GUI wird geöffnet...", notifWallhop = "Wallhop V3 aktiviert!", notifSaved = "Konfiguration erfolgreich gespeichert!", notifRejoin = "Verbindung zum Server wird wiederhergestellt...", notifHop = "Suche anderen Server...", notifEmpty = "Suche leeren Server...", notifEmptyNotFound = "Kein leerer Server...", notifTp = "Teleportiert zu: ", loaded = "AXEL SVK Hub v36 erfolgreich geladen!"
    },
    ru = {
        title = "⚡ AXEL SVK HUB",
        tabMain = "Главная", tabCombat = "Бой", tabMove = "Движение", tabAudio = "Аудио", tabEmotes = "Эмоции", tabRoba = "Roba un Huevo", tabUtils = "Утилиты",
        secMainTitle = "Главная панель", secCombatTitle = "Аимбот и ESP", secMoveTitle = "Утилиты движения", secAudioTitle = "Радио и громкость", secEmotesTitle = "Менеджер эмоций", secRobaTitle = "Roba un Huevo (Anti-Kick)", secUtilsTitle = "Утилиты и сервер",
        radio = "🎵 Радио AXEL (Funk ID)", vol = "Громкость музыки: ", fullbright = "Макс. яркость (FullBright)", aimbot = "Аимбот по FOV", teamcheck = "Проверка команды", fovshow = "Показать круг FOV", esp = "ESP сквозь стены", hitbox = "Расширитель хитбоксов", hitboxSizeLabel = "Размер хитбокса: ", hitboxColorLabel = "Цвет хитбокса: ", wallhop = "Wallhop V3 (Про скрипт)", noclip = "Ноклип (Проход сквозь стены)", invisibility = "Невидимость", dupe = "Дублировать предмет", emotebtn = "🕺 Открыть официальный Emote GUI",
        robaBypass = "Bypass Anti cheat (Safe)", robaStand = "Move to Stand", robaRespawn = "Respawn Character", robaTpWalk = "TP Walk (Anti-Rollback): ", robaSpeedLabel = "TP Speed: ",
        saveConfig = "💾 Сохранить настройки", rejoinBtn = "🔄 Переподключиться (Rejoin)", serverHopBtn = "🌐 Сменить сервер (Hop)", emptyServerBtn = "👻 Пустой сервер (Один)", tpPlayerTitle = "Телепорт к игроку: ",
        notifFunkOn = "Играет Funk!", notifFunkOff = "Музыка выключена.", notifVol = "Громкость изменена на ", notifOpenEmote = "Открытие Emote GUI...", notifWallhop = "Wallhop V3 включен!", notifSaved = "Настройки успешно сохранены!", notifRejoin = "Переподключение к серверу...", notifHop = "Поиск другого сервера...", notifEmpty = "Поиск пустого сервера...", notifEmptyNotFound = "Пустых нет...", notifTp = "Телепортирован к: ", loaded = "AXEL SVK Hub v36 успешно загружен!"
    },
    ja = {
        title = "⚡ AXEL SVK HUB",
        tabMain = "メイン", tabCombat = "戦闘", tabMove = "移動", tabAudio = "オーディオ", tabEmotes = "エモート", tabRoba = "Roba un Huevo", tabUtils = "ユーティリティ",
        secMainTitle = "メインパネル", secCombatTitle = "エイムボット & ESP", secMoveTitle = "移動ツール", secAudioTitle = "ラジオ & 音量", secEmotesTitle = "エモート管理", secRobaTitle = "Roba un Huevo (Anti-Kick)", secUtilsTitle = "ツール & サーバー",
        radio = "🎵 AXELラジオ (Funk ID)", vol = "音楽の音量: ", fullbright = "フルブライト (明るさ最大)", aimbot = "FOVエイムボット", teamcheck = "チームチェック", fovshow = "FOVサークルを表示", esp = "壁透視 (ESP)", hitbox = "ヒットボックス拡張", hitboxSizeLabel = "ヒットボックスサイズ: ", hitboxColorLabel = "ヒットボックスカラー: ", wallhop = "ウォールホップ V3 (プロスクリプト)", noclip = "ノークリップ (壁抜け)", invisibility = "透明化", dupe = "アイテム複製", emotebtn = "🕺 公式エモートGUIを開く",
        robaBypass = "Bypass Anti cheat (Safe)", robaStand = "Move to Stand", robaRespawn = "Respawn Character", robaTpWalk = "TP Walk (Anti-Rollback): ", robaSpeedLabel = "TP Speed: ",
        saveConfig = "💾 設定を保存", rejoinBtn = "🔄 再接続 (リジョイン)", serverHopBtn = "🌐 サーバーホップ", emptyServerBtn = "👻 空サーバー (ソロ)", tpPlayerTitle = "プレイヤーにテレポート: ",
        notifFunkOn = "ファンク再生中！", notifFunkOff = "音楽をオフにしました。", notifVol = "音量が変更されました: ", notifOpenEmote = "エモートGUIを開いています...", notifWallhop = "ウォールホップV3が有効化されました！", notifSaved = "設定が正常に保存されました！", notifRejoin = "サーバーに再接続中...", notifHop = "別のサーバーを検索中...", notifEmpty = "空のサーバーを検索中...", notifEmptyNotFound = "見つかりません...", notifTp = "テレポートしました: ", loaded = "AXEL SVK Hub v36 の読み込みに成功しました！"
    },
    zh = {
        title = "⚡ AXEL SVK HUB",
        tabMain = "主页", tabCombat = "战斗", tabMove = "移动", tabAudio = "音频", tabEmotes = "动作", tabRoba = "Roba un Huevo", tabUtils = "实用工具",
        secMainTitle = "主面板", secCombatTitle = "自瞄与透视", secMoveTitle = "移动工具", secAudioTitle = "电台与音量", secEmotesTitle = "动作管理器", secRobaTitle = "Roba un Huevo (Anti-Kick)", secUtilsTitle = "工具与服务器",
        radio = "🎵 AXEL 电台 (Funk ID)", vol = "音乐音量: ", fullbright = "全亮 (FullBright)", aimbot = "FOV 自瞄", teamcheck = "队伍检查", fovshow = "显示 FOV 圆圈", esp = "透视 (ESP)", hitbox = "扩大判定框", hitboxSizeLabel = "判定框大小: ", hitboxColorLabel = "判定框颜色: ", wallhop = "卡墙跳 V3 (专业脚本)", noclip = "穿墙 (Noclip)", invisibility = "隐身", dupe = "复制物品", emotebtn = "🕺 打开官方动作界面",
        robaBypass = "Bypass Anti cheat (Safe)", robaStand = "Move to Stand", robaRespawn = "Respawn Character", robaTpWalk = "TP Walk (Anti-Rollback): ", robaSpeedLabel = "TP Speed: ",
        saveConfig = "💾 保存配置", rejoinBtn = "🔄 重新加入 (Rejoin)", serverHopBtn = "🌐 换服务器 (Hop)", emptyServerBtn = "👻 空服务器 (独享)", tpPlayerTitle = "传送到玩家: ",
        notifFunkOn = "Funk 正在播放！", notifFunkOff = "音乐已关闭。", notifVol = "音量更改为 ", notifOpenEmote = "正在打开动作界面...", notifWallhop = "Wallhop V3 已启用！", notifSaved = "配置保存成功！", notifRejoin = "正在重新连接服务器...", notifHop = "正在搜索其他服务器...", notifEmpty = "正在搜索空服务器...", notifEmptyNotFound = "未找到空服务器...", notifTp = "已传送到: ", loaded = "AXEL SVK Hub v36 加载成功！"
    },
    ar = {
        title = "⚡ AXEL SVK HUB",
        tabMain = "الرئيسية", tabCombat = "القتال", tabMove = "الحركة", tabAudio = "الصوت", tabEmotes = "الرقصات", tabRoba = "Roba un Huevo", tabUtils = "الأدوات",
        secMainTitle = "لوحة التحكم الرئيسية", secCombatTitle = "التوجيه التلقائي وكشف الأماكن", secMoveTitle = "أدوات الحركة", secAudioTitle = "الراديو والصوت", secEmotesTitle = "مدير الحركات", secRobaTitle = "Roba un Huevo (Anti-Kick)", secUtilsTitle = "الأدوات والخادم",
        radio = "🎵 راديو AXEL (معرف الفانك)", vol = "مستوى صوت الموسيقى: ", fullbright = "إضاءة كاملة", aimbot = "توجيه تلقائي بـ FOV", teamcheck = "فحص الفريق", fovshow = "إظهار دائرة FOV", esp = "كشف الأماكن عبر الجدران", hitbox = "موسع صندوق الإصابة", hitboxSizeLabel = "حجم صندوق الإصابة: ", hitboxColorLabel = "لون صندوق الإصابة: ", wallhop = "قفزة الجدار V3", noclip = "اختراق الجدران (Noclip)", invisibility = "الخفاء", dupe = "تنسيق العنصر", emotebtn = "🕺 فتح واجهة الرقصات الرسمية",
        robaBypass = "Bypass Anti cheat (Safe)", robaStand = "Move to Stand", robaRespawn = "Respawn Character", robaTpWalk = "TP Walk (Anti-Rollback): ", robaSpeedLabel = "TP Speed: ",
        saveConfig = "💾 حفظ الإعدادات", rejoinBtn = "🔄 إعادة الانضمام", serverHopBtn = "🌐 تغيير الخادم (Hop)", emptyServerBtn = "👻 خادم فارغ (لوحدك)", tpPlayerTitle = "الانتقال إلى اللاعب: ",
        notifFunkOn = "موسيقى الفانك تعمل!", notifFunkOff = "تم إيقاف الموسيقى.", notifVol = "تم تغيير الصوت إلى ", notifOpenEmote = "جاري فتح واجهة الرقصات...", notifWallhop = "تم تفعيل قفزة الجدار V3!", notifSaved = "تم حفظ الإعدادات بنجاح!", notifRejoin = "جاري إعادة الاتصال بالخادم...", notifHop = "جاري البحث عن خادم آخر...", notifEmpty = "جاري البحث عن خادم فارغ...", notifEmptyNotFound = "لم يتم العثور على فارغ...", notifTp = "تم الانتقال إلى: ", loaded = "تم تحميل AXEL SVK Hub v36 بنجاح!"
    }
}

local function L(key)
    if Translations[currentLang] and Translations[currentLang][key] then
        return Translations[currentLang][key]
    end
    return Translations["es"][key] or key
end

-- ==========================================
-- 3. CONFIGURACIÓN Y VALORES
-- ==========================================
local Config = {
    AimbotUniversal = false,
    AimPart = "Head",
    TeamCheck = true,
    FOVVisible = true,
    FOVRadius = 130,
    WallESP = false,
    FunkRadio = false,
    MusicVolume = 0.5,
    HitboxExpander = false,
    HitboxSizeIdx = 2,
    HitboxColorIdx = 1,
    DupeTools = false,
    Noclip = false,
    Invisibility = false,
    FullBright = true,
    RobaTpWalk = false,
    RobaTpSpeed = 25
}

local configFile = "AxelSvkConfig.json"

local function saveConfigToFile()
    pcall(function()
        if writefile then
            local data = HttpService:JSONEncode(Config)
            writefile(configFile, data)
        end
    end)
end

local function loadConfigFromFile()
    pcall(function()
        if readfile and isfile and isfile(configFile) then
            local data = readfile(configFile)
            local decoded = HttpService:JSONDecode(data)
            for k, v in pairs(decoded) do
                Config[k] = v
            end
        end
    end)
end

loadConfigFromFile()

local sizeNames = {"Pequeño (4)", "Mediano (6)", "Grande (10)", "Extra Grande (15)"}
local sizeValues = {4, 6, 10, 15}

local colorNames = {"Rojo", "Verde", "Azul", "Amarillo", "Magenta"}
local colorValues = {
    Color3.fromRGB(255, 40, 50),
    Color3.fromRGB(40, 255, 100),
    Color3.fromRGB(40, 120, 255),
    Color3.fromRGB(255, 230, 40),
    Color3.fromRGB(255, 40, 220)
}

local FunkSound = Instance.new("Sound")
FunkSound.Name = "AxelSvkFunkPlayer"
FunkSound.SoundId = "rbxassetid://128552555209564"
FunkSound.Looped = true
FunkSound.Volume = Config.MusicVolume
FunkSound.Parent = SoundService

local FOVGui = Instance.new("ScreenGui")
FOVGui.Name = "FOVCircleGui"
FOVGui.ResetOnSpawn = false
FOVGui.Parent = RootGui

local FOVCircleFrame = Instance.new("Frame", FOVGui)
FOVCircleFrame.Size = UDim2.new(0, Config.FOVRadius * 2, 0, Config.FOVRadius * 2)
FOVCircleFrame.AnchorPoint = Vector2.new(0.5, 0.5)
FOVCircleFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
FOVCircleFrame.BackgroundTransparency = 1
FOVCircleFrame.Visible = false
Instance.new("UICorner", FOVCircleFrame).CornerRadius = UDim.new(1, 0)
local UIStroke = Instance.new("UIStroke", FOVCircleFrame)
UIStroke.Color = Color3.fromRGB(255, 40, 50)
UIStroke.Thickness = 1.5

-- Botón Flotante
local ToggleButton = Instance.new("TextButton", RootGui)
ToggleButton.Size = UDim2.new(0, 52, 0, 52)
ToggleButton.Position = UDim2.new(0.04, 0, 0.32, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(12, 8, 12)
ToggleButton.TextColor3 = Color3.fromRGB(50, 255, 80)
ToggleButton.Text = "AS"
ToggleButton.TextSize = 14
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.Active = true
ToggleButton.Draggable = true
ToggleButton.Visible = false
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(1, 0)
local ToggleStroke = Instance.new("UIStroke", ToggleButton)
ToggleStroke.Color = Color3.fromRGB(255, 40, 50)
ToggleStroke.Thickness = 2

-- Ventana Principal
local MainFrame = Instance.new("Frame", RootGui)
MainFrame.Size = UDim2.new(0, 560, 0, 380)
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(14, 12, 18)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(255, 40, 50)
MainStroke.Thickness = 1.5

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Barra Superior
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 42)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 12, 18)
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -130, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 13
Title.Font = Enum.Font.GothamBold
Title.Text = L("title")
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Botón de Idiomas
local LangOpenBtn = Instance.new("TextButton", TopBar)
LangOpenBtn.Size = UDim2.new(0, 32, 0, 32)
LangOpenBtn.Position = UDim2.new(1, -78, 0.5, -16)
LangOpenBtn.BackgroundColor3 = Color3.fromRGB(35, 12, 18)
LangOpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
LangOpenBtn.Text = "🌐"
LangOpenBtn.TextSize = 13
Instance.new("UICorner", LangOpenBtn).CornerRadius = UDim.new(0, 6)

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 32, 0, 32)
CloseBtn.Position = UDim2.new(1, -38, 0.5, -16)
CloseBtn.BackgroundColor3 = Color3.fromRGB(35, 12, 18)
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseBtn.Text = "X"
CloseBtn.TextSize = 12
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
CloseBtn.MouseButton1Click:Connect(function() MainFrame.Visible = false end)

-- ==========================================
-- 4. PANEL LATERAL DE IDIOMAS
-- ==========================================
local SettingsPanel = Instance.new("Frame", RootGui)
SettingsPanel.Size = UDim2.new(0, 230, 0, 380)
SettingsPanel.Position = UDim2.new(0.5, 290, 0.5, -190)
SettingsPanel.BackgroundColor3 = Color3.fromRGB(14, 12, 18)
SettingsPanel.Visible = false
SettingsPanel.Active = true
SettingsPanel.Draggable = true
Instance.new("UICorner", SettingsPanel).CornerRadius = UDim.new(0, 10)
local SettingsStroke = Instance.new("UIStroke", SettingsPanel)
SettingsStroke.Color = Color3.fromRGB(255, 40, 50)
SettingsStroke.Thickness = 1.5

local LangsScroll = Instance.new("ScrollingFrame", SettingsPanel)
LangsScroll.Size = UDim2.new(1, -16, 1, -55)
LangsScroll.Position = UDim2.new(0, 8, 0, 48)
LangsScroll.BackgroundTransparency = 1
LangsScroll.CanvasSize = UDim2.new(0, 0, 0, 420)
LangsScroll.ScrollBarThickness = 2

LangOpenBtn.MouseButton1Click:Connect(function()
    SettingsPanel.Visible = not SettingsPanel.Visible
end)

-- ==========================================
-- 5. DISEÑO DE PESTAÑAS (IZQUIERDA)
-- ==========================================
local Sidebar = Instance.new("ScrollingFrame", MainFrame)
Sidebar.Size = UDim2.new(0, 150, 1, -55)
Sidebar.Position = UDim2.new(0, 8, 0, 48)
Sidebar.BackgroundTransparency = 1
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 340)
Sidebar.ScrollBarThickness = 2

local ContentPanel = Instance.new("Frame", MainFrame)
ContentPanel.Size = UDim2.new(1, -170, 1, -55)
ContentPanel.Position = UDim2.new(0, 162, 0, 48)
ContentPanel.BackgroundColor3 = Color3.fromRGB(10, 8, 14)
Instance.new("UICorner", ContentPanel).CornerRadius = UDim.new(0, 8)

local ContentTitle = Instance.new("TextLabel", ContentPanel)
ContentTitle.Size = UDim2.new(1, -15, 0, 30)
ContentTitle.Position = UDim2.new(0, 10, 0, 5)
ContentTitle.BackgroundTransparency = 1
ContentTitle.TextColor3 = Color3.fromRGB(50, 255, 80)
ContentTitle.TextSize = 13
ContentTitle.Font = Enum.Font.GothamBold
ContentTitle.TextXAlignment = Enum.TextXAlignment.Left

local SubContainer = Instance.new("ScrollingFrame", ContentPanel)
SubContainer.Size = UDim2.new(1, -12, 1, -45)
SubContainer.Position = UDim2.new(0, 6, 0, 40)
SubContainer.BackgroundTransparency = 1
SubContainer.CanvasSize = UDim2.new(0, 0, 0, 500)
SubContainer.ScrollBarThickness = 2

local currentTab = "Main"
local tabButtons = {}

local function notify(text)
    pcall(function()
        local notif = Instance.new("TextLabel", RootGui)
        notif.Size = UDim2.new(0, 280, 0, 45)
        notif.Position = UDim2.new(0.5, -140, 0.04, 0)
        notif.BackgroundColor3 = Color3.fromRGB(12, 8, 12)
        notif.TextColor3 = Color3.fromRGB(50, 255, 80)
        notif.TextSize = 13
        notif.Font = Enum.Font.GothamBold
        notif.Text = "⚡ " .. text
        Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 8)
        local stroke = Instance.new("UIStroke", notif)
        stroke.Color = Color3.fromRGB(255, 40, 50)
        stroke.Thickness = 1.5
        task.delay(2.5, function() notif:Destroy() end)
    end)
end

-- 🛠️ FUNCIÓN DE DUPLICACIÓN MULTI-JUEGO MEJORADA
local function executeMultiGameDupe()
    pcall(function()
        local backpack = localPlayer:FindFirstChildOfClass("Backpack")
        local character = localPlayer.Character
        local duplicated = false

        if character then
            local toolInHand = character:FindFirstChildOfClass("Tool")
            if toolInHand and backpack then
                local clone = toolInHand:Clone()
                clone.Parent = backpack
                duplicated = true
            end
        end

        if not duplicated and backpack then
            local toolInBackpack = backpack:FindFirstChildOfClass("Tool")
            if toolInBackpack then
                local clone = toolInBackpack:Clone()
                clone.Parent = backpack
                duplicated = true
            end
        end

        pcall(function()
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("RemoteEvent") and (string.lower(v.Name):find("dupe") or string.lower(v.Name):find("clone") or string.lower(v.Name):find("store") or string.lower(v.Name):find("save")) then
                    v:FireServer(localPlayer)
                    duplicated = true
                end
            end
        end)

        if duplicated then
            notify("¡Duplicación ejecutada con éxito!")
        else
            notify("No se encontraron ítems o eventos de dupeo compatibles en este juego.")
        end
    end)
end

local function loadTabContent(tabName)
    for _, child in pairs(SubContainer:GetChildren()) do
        if child:IsA("GuiObject") then child:Destroy() end
    end
    
    local y = 0
    local function addToggle(keyName, initialState, callback)
        local btn = Instance.new("TextButton", SubContainer)
        btn.Size = UDim2.new(1, 0, 0, 36)
        btn.Position = UDim2.new(0, 0, 0, y)
        btn.BackgroundColor3 = initialState and Color3.fromRGB(120, 20, 35) or Color3.fromRGB(18, 14, 18)
        btn.TextColor3 = Color3.fromRGB(220, 210, 220)
        btn.TextSize = 12
        btn.Font = Enum.Font.GothamMedium
        btn.Text = "   " .. L(keyName) .. (initialState and " [ ON ]" or " [ OFF ]")
        btn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
        
        local indicator = Instance.new("Frame", btn)
        indicator.Size = UDim2.new(0, 10, 0, 10)
        indicator.Position = UDim2.new(1, -20, 0.5, -5)
        indicator.BackgroundColor3 = initialState and Color3.fromRGB(0, 255, 120) or Color3.fromRGB(120, 100, 110)
        Instance.new("UICorner", indicator).CornerRadius = UDim.new(1, 0)
        
        local active = initialState
        btn.MouseButton1Click:Connect(function()
            active = not active
            if active then
                btn.BackgroundColor3 = Color3.fromRGB(120, 20, 35)
                indicator.BackgroundColor3 = Color3.fromRGB(0, 255, 120)
                btn.Text = "   " .. L(keyName) .. " [ ON ]"
            else
                btn.BackgroundColor3 = Color3.fromRGB(18, 14, 18)
                indicator.BackgroundColor3 = Color3.fromRGB(120, 100, 110)
                btn.Text = "   " .. L(keyName) .. " [ OFF ]"
            end
            callback(active)
        end)
        y = y + 42
    end

    if tabName == "Main" then
        ContentTitle.Text = L("secMainTitle")
        addToggle("fullbright", Config.FullBright, function(v) Config.FullBright = v end)
        addToggle("invisibility", Config.Invisibility, function(v) Config.Invisibility = v end)
    elseif tabName == "Combat" then
        ContentTitle.Text = L("secCombatTitle")
        addToggle("aimbot", Config.AimbotUniversal, function(v) Config.AimbotUniversal = v end)
        addToggle("teamcheck", Config.TeamCheck, function(v) Config.TeamCheck = v end)
        addToggle("fovshow", Config.FOVVisible, function(v) Config.FOVVisible = v FOVCircleFrame.Visible = v end)
        addToggle("esp", Config.WallESP, function(v) Config.WallESP = v end)
        addToggle("hitbox", Config.HitboxExpander, function(v) Config.HitboxExpander = v end)
        
        local SizeBtn = Instance.new("TextButton", SubContainer)
        SizeBtn.Size = UDim2.new(1, 0, 0, 36)
        SizeBtn.Position = UDim2.new(0, 0, 0, y)
        SizeBtn.BackgroundColor3 = Color3.fromRGB(18, 14, 18)
        SizeBtn.TextColor3 = Color3.fromRGB(220, 210, 220)
        SizeBtn.TextSize = 12
        SizeBtn.Font = Enum.Font.GothamMedium
        SizeBtn.Text = "   📏 " .. L("hitboxSizeLabel") .. sizeNames[Config.HitboxSizeIdx]
        SizeBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", SizeBtn).CornerRadius = UDim.new(0, 8)
        SizeBtn.MouseButton1Click:Connect(function()
            Config.HitboxSizeIdx = Config.HitboxSizeIdx + 1
            if Config.HitboxSizeIdx > #sizeNames then Config.HitboxSizeIdx = 1 end
            SizeBtn.Text = "   📏 " .. L("hitboxSizeLabel") .. sizeNames[Config.HitboxSizeIdx]
            notify("Tamaño Hitbox: " .. sizeNames[Config.HitboxSizeIdx])
        end)
        y = y + 42

        local ColorBtn = Instance.new("TextButton", SubContainer)
        ColorBtn.Size = UDim2.new(1, 0, 0, 36)
        ColorBtn.Position = UDim2.new(0, 0, 0, y)
        ColorBtn.BackgroundColor3 = Color3.fromRGB(18, 14, 18)
        ColorBtn.TextColor3 = Color3.fromRGB(220, 210, 220)
        ColorBtn.TextSize = 12
        ColorBtn.Font = Enum.Font.GothamMedium
        ColorBtn.Text = "   🎨 " .. L("hitboxColorLabel") .. colorNames[Config.HitboxColorIdx]
        ColorBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", ColorBtn).CornerRadius = UDim.new(0, 8)
        
        local colorIndicator = Instance.new("Frame", ColorBtn)
        colorIndicator.Size = UDim2.new(0, 14, 0, 14)
        colorIndicator.Position = UDim2.new(1, -24, 0.5, -7)
        colorIndicator.BackgroundColor3 = colorValues[Config.HitboxColorIdx]
        Instance.new("UICorner", colorIndicator).CornerRadius = UDim.new(1, 0)

        ColorBtn.MouseButton1Click:Connect(function()
            Config.HitboxColorIdx = Config.HitboxColorIdx + 1
            if Config.HitboxColorIdx > #colorNames then Config.HitboxColorIdx = 1 end
            ColorBtn.Text = "   🎨 " .. L("hitboxColorLabel") .. colorNames[Config.HitboxColorIdx]
            colorIndicator.BackgroundColor3 = colorValues[Config.HitboxColorIdx]
            notify("Color Hitbox: " .. colorNames[Config.HitboxColorIdx])
        end)
        y = y + 42

    elseif tabName == "Movement" then
        ContentTitle.Text = L("secMoveTitle")
        
        local WallhopBtn = Instance.new("TextButton", SubContainer)
        WallhopBtn.Size = UDim2.new(1, 0, 0, 36)
        WallhopBtn.Position = UDim2.new(0, 0, 0, y)
        WallhopBtn.BackgroundColor3 = Color3.fromRGB(150, 20, 40)
        WallhopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        WallhopBtn.TextSize = 12
        WallhopBtn.Font = Enum.Font.GothamBold
        WallhopBtn.Text = "   🦘 " .. L("wallhop")
        WallhopBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", WallhopBtn).CornerRadius = UDim.new(0, 8)
        WallhopBtn.MouseButton1Click:Connect(function()
            notify(L("notifWallhop"))
            pcall(function()
                loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Wallhop-V3-46344"))()
            end)
        end)
        y = y + 42

        addToggle("noclip", Config.Noclip, function(v) Config.Noclip = v end)
        
        addToggle("dupe", Config.DupeTools, function(v) 
            Config.DupeTools = v 
            if v then
                executeMultiGameDupe()
            end
        end)
    elseif tabName == "Audio" then
        ContentTitle.Text = L("secAudioTitle")
        addToggle("radio", Config.FunkRadio, function(v) 
            Config.FunkRadio = v 
            if v then FunkSound:Play() notify(L("notifFunkOn")) else FunkSound:Stop() notify(L("notifFunkOff")) end
        end)
        
        local VolBtn = Instance.new("TextButton", SubContainer)
        VolBtn.Size = UDim2.new(1, 0, 0, 36)
        VolBtn.Position = UDim2.new(0, 0, 0, y)
        VolBtn.BackgroundColor3 = Color3.fromRGB(18, 14, 18)
        VolBtn.TextColor3 = Color3.fromRGB(220, 210, 220)
        VolBtn.TextSize = 12
        VolBtn.Font = Enum.Font.GothamMedium
        VolBtn.Text = "   🔊 " .. L("vol") .. "50%"
        VolBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", VolBtn).CornerRadius = UDim.new(0, 8)
        
        local volLevels = {0.2, 0.5, 1.0, 1.5}
        local volNames = {"20%", "50%", "100%", "150%"}
        local currentVolIdx = 2
        VolBtn.MouseButton1Click:Connect(function()
            currentVolIdx = currentVolIdx + 1
            if currentVolIdx > #volLevels then currentVolIdx = 1 end
            Config.MusicVolume = volLevels[currentVolIdx]
            FunkSound.Volume = Config.MusicVolume
            VolBtn.Text = "   🔊 " .. L("vol") .. volNames[currentVolIdx]
            notify(L("notifVol") .. volNames[currentVolIdx])
        end)
        y = y + 42
    elseif tabName == "Emotes" then
        ContentTitle.Text = L("secEmotesTitle")
        local EmoteBtn = Instance.new("TextButton", SubContainer)
        EmoteBtn.Size = UDim2.new(1, 0, 0, 40)
        EmoteBtn.Position = UDim2.new(0, 0, 0, y)
        EmoteBtn.BackgroundColor3 = Color3.fromRGB(150, 20, 40)
        EmoteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        EmoteBtn.TextSize = 13
        EmoteBtn.Font = Enum.Font.GothamBold
        EmoteBtn.Text = L("emotebtn")
        EmoteBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", EmoteBtn).CornerRadius = UDim.new(0, 8)
        EmoteBtn.MouseButton1Click:Connect(function()
            notify(L("notifOpenEmote"))
            pcall(function()
                loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Emote-Gui-75782"))()
            end)
        end)
        y = y + 48
    elseif tabName == "Roba" then
        ContentTitle.Text = L("secRobaTitle")
        
        -- 1. Bypass Anti cheat (Seguro y optimizado contra kicks)
        local BypassBtn = Instance.new("TextButton", SubContainer)
        BypassBtn.Size = UDim2.new(1, 0, 0, 36)
        BypassBtn.Position = UDim2.new(0, 0, 0, y)
        BypassBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
        BypassBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        BypassBtn.TextSize = 12
        BypassBtn.Font = Enum.Font.GothamBold
        BypassBtn.Text = "   🛡️ " .. L("robaBypass")
        BypassBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", BypassBtn).CornerRadius = UDim.new(0, 8)
        BypassBtn.MouseButton1Click:Connect(function()
            notify("¡Bypass Anti-Cheat Seguro activado!")
            pcall(function()
                for _, conn in pairs(getconnections(localPlayer.Idled)) do
                    conn:Disable()
                end
            end)
        end)
        y = y + 42

        -- 2. Move to Stand (Fluido con Tween para evitar kick)
        local StandBtn = Instance.new("TextButton", SubContainer)
        StandBtn.Size = UDim2.new(1, 0, 0, 36)
        StandBtn.Position = UDim2.new(0, 0, 0, y)
        StandBtn.BackgroundColor3 = Color3.fromRGB(40, 100, 180)
        StandBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        StandBtn.TextSize = 12
        StandBtn.Font = Enum.Font.GothamBold
        StandBtn.Text = "   📍 " .. L("robaStand")
        StandBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", StandBtn).CornerRadius = UDim.new(0, 8)
        StandBtn.MouseButton1Click:Connect(function()
            notify("Desplazando con seguridad al Stand...")
            pcall(function()
                for _, obj in pairs(Workspace:GetDescendants()) do
                    if obj:IsA("Model") and (obj.Name:lower():find("stand") or obj.Name:lower():find("base") or obj.Name:lower():find("store")) then
                        local part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                        if part and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local hrp = localPlayer.Character.HumanoidRootPart
                            local targetCF = part.CFrame + Vector3.new(0, 3, 0)
                            
                            for i = 0, 1, 0.25 do
                                hrp.CFrame = hrp.CFrame:Lerp(targetCF, i)
                                task.wait(0.02)
                            end
                            hrp.CFrame = targetCF
                            break
                        end
                    end
                end
            end)
        end)
        y = y + 42

        -- 3. Respawn Character
        local RespawnBtn = Instance.new("TextButton", SubContainer)
        RespawnBtn.Size = UDim2.new(1, 0, 0, 36)
        RespawnBtn.Position = UDim2.new(0, 0, 0, y)
        RespawnBtn.BackgroundColor3 = Color3.fromRGB(120, 80, 20)
        RespawnBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        RespawnBtn.TextSize = 12
        RespawnBtn.Font = Enum.Font.GothamBold
        RespawnBtn.Text = "   🔄 " .. L("robaRespawn")
        RespawnBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", RespawnBtn).CornerRadius = UDim.new(0, 8)
        RespawnBtn.MouseButton1Click:Connect(function()
            notify("Respawneando personaje...")
            pcall(function()
                if localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    localPlayer.Character.Humanoid.Health = 0
                end
            end)
        end)
        y = y + 42

        -- 4. TP Walk Anti-Rollback Toggle
        addToggle("robaTpWalk", Config.RobaTpWalk, function(v) 
            Config.RobaTpWalk = v 
            if v then notify("TP Walk Anti-Rollback Activado") else notify("TP Walk Desactivado") end
        end)

        -- 5. Selector de Velocidad Segura TP Walk
        local SpeedBtn = Instance.new("TextButton", SubContainer)
        SpeedBtn.Size = UDim2.new(1, 0, 0, 36)
        SpeedBtn.Position = UDim2.new(0, 0, 0, y)
        SpeedBtn.BackgroundColor3 = Color3.fromRGB(18, 14, 18)
        SpeedBtn.TextColor3 = Color3.fromRGB(220, 210, 220)
        SpeedBtn.TextSize = 12
        SpeedBtn.Font = Enum.Font.GothamMedium
        SpeedBtn.Text = "   ⚡ " .. L("robaSpeedLabel") .. Config.RobaTpSpeed .. " Studs/s"
        SpeedBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", SpeedBtn).CornerRadius = UDim.new(0, 8)
        
        local speeds = {16, 25, 35, 50}
        local sIdx = 2
        SpeedBtn.MouseButton1Click:Connect(function()
            sIdx = sIdx + 1
            if sIdx > #speeds then sIdx = 1 end
            Config.RobaTpSpeed = speeds[sIdx]
            SpeedBtn.Text = "   ⚡ " .. L("robaSpeedLabel") .. Config.RobaTpSpeed .. " Studs/s"
            notify("Velocidad Segura TP: " .. Config.RobaTpSpeed .. " Studs/s")
        end)
        y = y + 42

    elseif tabName == "Utils" then
        ContentTitle.Text = L("secUtilsTitle")
        
        local SaveBtn = Instance.new("TextButton", SubContainer)
        SaveBtn.Size = UDim2.new(1, 0, 0, 36)
        SaveBtn.Position = UDim2.new(0, 0, 0, y)
        SaveBtn.BackgroundColor3 = Color3.fromRGB(40, 120, 50)
        SaveBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        SaveBtn.TextSize = 12
        SaveBtn.Font = Enum.Font.GothamBold
        SaveBtn.Text = "   " .. L("saveConfig")
        SaveBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", SaveBtn).CornerRadius = UDim.new(0, 8)
        SaveBtn.MouseButton1Click:Connect(function()
            saveConfigToFile()
            notify(L("notifSaved"))
        end)
        y = y + 42

        local RejoinBtn = Instance.new("TextButton", SubContainer)
        RejoinBtn.Size = UDim2.new(1, 0, 0, 36)
        RejoinBtn.Position = UDim2.new(0, 0, 0, y)
        RejoinBtn.BackgroundColor3 = Color3.fromRGB(18, 14, 18)
        RejoinBtn.TextColor3 = Color3.fromRGB(220, 210, 220)
        RejoinBtn.TextSize = 12
        RejoinBtn.Font = Enum.Font.GothamMedium
        RejoinBtn.Text = "   " .. L("rejoinBtn")
        RejoinBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", RejoinBtn).CornerRadius = UDim.new(0, 8)
        RejoinBtn.MouseButton1Click:Connect(function()
            notify(L("notifRejoin"))
            task.wait(0.5)
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
        end)
        y = y + 42

        local HopBtn = Instance.new("TextButton", SubContainer)
        HopBtn.Size = UDim2.new(1, 0, 0, 36)
        HopBtn.Position = UDim2.new(0, 0, 0, y)
        HopBtn.BackgroundColor3 = Color3.fromRGB(18, 14, 18)
        HopBtn.TextColor3 = Color3.fromRGB(220, 210, 220)
        HopBtn.TextSize = 12
        HopBtn.Font = Enum.Font.GothamMedium
        HopBtn.Text = "   " .. L("serverHopBtn")
        HopBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", HopBtn).CornerRadius = UDim.new(0, 8)
        HopBtn.MouseButton1Click:Connect(function()
            notify(L("notifHop"))
            pcall(function()
                local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
                for _, s in pairs(servers.data) do
                    if s.playing < s.maxPlayers and s.id ~= game.JobId then
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, localPlayer)
                        break
                    end
                end
            end)
        end)
        y = y + 42

        local EmptyBtn = Instance.new("TextButton", SubContainer)
        EmptyBtn.Size = UDim2.new(1, 0, 0, 36)
        EmptyBtn.Position = UDim2.new(0, 0, 0, y)
        EmptyBtn.BackgroundColor3 = Color3.fromRGB(80, 20, 100)
        EmptyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        EmptyBtn.TextSize = 12
        EmptyBtn.Font = Enum.Font.GothamBold
        EmptyBtn.Text = "   " .. L("emptyServerBtn")
        EmptyBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", EmptyBtn).CornerRadius = UDim.new(0, 8)
        EmptyBtn.MouseButton1Click:Connect(function()
            notify(L("notifEmpty"))
            task.spawn(function()
                pcall(function()
                    local found = false
                    local cursor = ""
                    repeat
                        local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
                        if cursor ~= "" then
                            url = url .. "&cursor=" .. cursor
                        end
                        local success, result = pcall(function()
                            return game:HttpGet(url)
                        end)
                        if success then
                            local data = HttpService:JSONDecode(result)
                            for _, s in pairs(data.data) do
                                if s.playing >= 1 and s.playing <= 3 and s.playing < s.maxPlayers and s.id ~= game.JobId then
                                    local tpSuccess = pcall(function()
                                        TeleportService:TeleportToPlaceInstance(game.PlaceId, s.id, localPlayer)
                                    end)
                                    if tpSuccess then
                                        found = true
                                        break
                                    end
                                end
                            end
                            cursor = data.nextPageCursor
                        else
                            break
                        end
                    until found or not cursor
                    
                    if not found then
                        notify(L("notifEmptyNotFound"))
                    end
                end)
            end)
        end)
        y = y + 42

        local selectedTarget = nil
        local TpSelectBtn = Instance.new("TextButton", SubContainer)
        TpSelectBtn.Size = UDim2.new(1, 0, 0, 36)
        TpSelectBtn.Position = UDim2.new(0, 0, 0, y)
        TpSelectBtn.BackgroundColor3 = Color3.fromRGB(18, 14, 18)
        TpSelectBtn.TextColor3 = Color3.fromRGB(220, 210, 220)
        TpSelectBtn.TextSize = 12
        TpSelectBtn.Font = Enum.Font.GothamMedium
        TpSelectBtn.Text = "   👥 Target: [ Ninguno ]"
        TpSelectBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", TpSelectBtn).CornerRadius = UDim.new(0, 8)

        local playersList = Players:GetPlayers()
        local pIdx = 1
        TpSelectBtn.MouseButton1Click:Connect(function()
            playersList = Players:GetPlayers()
            pIdx = pIdx + 1
            if pIdx > #playersList then pIdx = 1 end
            local target = playersList[pIdx]
            if target and target ~= localPlayer then
                selectedTarget = target
                TpSelectBtn.Text = "   👥 Target: " .. target.Name
            else
                selectedTarget = nil
                TpSelectBtn.Text = "   👥 Target: [ Ninguno ]"
            end
        end)
        y = y + 42

        local TpActionBtn = Instance.new("TextButton", SubContainer)
        TpActionBtn.Size = UDim2.new(1, 0, 0, 36)
        TpActionBtn.Position = UDim2.new(0, 0, 0, y)
        TpActionBtn.BackgroundColor3 = Color3.fromRGB(120, 20, 35)
        TpActionBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        TpActionBtn.TextSize = 12
        TpActionBtn.Font = Enum.Font.GothamBold
        TpActionBtn.Text = "   ⚡ Teleport al Target"
        TpActionBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", TpActionBtn).CornerRadius = UDim.new(0, 8)
        TpActionBtn.MouseButton1Click:Connect(function()
            if selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") then
                if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    localPlayer.Character.HumanoidRootPart.CFrame = selectedTarget.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                    notify(L("notifTp") .. selectedTarget.Name)
                end
            end
        end)
        y = y + 42
    end
    SubContainer.CanvasSize = UDim2.new(0, 0, 0, y)
end

local function createSidebarTab(tabNameKey, internalName)
    local btn = Instance.new("TextButton", Sidebar)
    btn.Size = UDim2.new(1, 0, 0, 36)
    btn.Position = UDim2.new(0, 0, 0, (#tabButtons * 42))
    btn.BackgroundColor3 = (currentTab == internalName) and Color3.fromRGB(120, 20, 35) or Color3.fromRGB(18, 14, 18)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 12
    btn.Font = Enum.Font.GothamMedium
    btn.Text = "   " .. L(tabNameKey)
    btn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    
    table.insert(tabButtons, {key = tabNameKey, internal = internalName, obj = btn})
    
    btn.MouseButton1Click:Connect(function()
        currentTab = internalName
        for _, b in pairs(tabButtons) do
            if b.internal == currentTab then
                b.obj.BackgroundColor3 = Color3.fromRGB(120, 20, 35)
            else
                b.obj.BackgroundColor3 = Color3.fromRGB(18, 14, 18)
            end
        end
        loadTabContent(currentTab)
    end)
end

createSidebarTab("tabMain", "Main")
createSidebarTab("tabCombat", "Combat")
createSidebarTab("tabMove", "Movement")
createSidebarTab("tabAudio", "Audio")
createSidebarTab("tabEmotes", "Emotes")
createSidebarTab("tabRoba", "Roba")
createSidebarTab("tabUtils", "Utils")
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 310)
loadTabContent("Main")

-- ==========================================
-- 6. BANDERAS IDIOMAS
-- ==========================================
local languagesList = {
    {code = "es", name = "Español", flag = "🇪🇸"},
    {code = "en", name = "English", flag = "🇺🇸"},
    {code = "pt", name = "Português", flag = "🇧🇷"},
    {code = "fr", name = "Français", flag = "🇫🇷"},
    {code = "de", name = "Deutsch", flag = "🇩🇪"},
    {code = "ru", name = "Русский", flag = "🇷🇺"},
    {code = "ja", name = "日本語", flag = "🇯🇵"},
    {code = "zh", name = "中文", flag = "🇨🇳"},
    {code = "ar", name = "العربية", flag = "🇸🇦"}
}

local flagButtons = {}

local function updateLanguage(code)
    currentLang = code
    Title.Text = L("title")
    for _, b in pairs(tabButtons) do
        b.obj.Text = "   " .. L(b.key)
    end
    for _, btn in pairs(flagButtons) do
        if btn.code == code then
            btn.obj.BackgroundColor3 = Color3.fromRGB(120, 20, 35)
            btn.obj.Text = "  ✓ " .. btn.flag .. "  " .. btn.name
        else
            btn.obj.BackgroundColor3 = Color3.fromRGB(18, 14, 18)
            btn.obj.Text = "    " .. btn.flag .. "  " .. btn.name
        end
    end
    loadTabContent(currentTab)
end

local yPos = 0
for _, lang in ipairs(languagesList) do
    local fBtn = Instance.new("TextButton", LangsScroll)
    fBtn.Size = UDim2.new(1, 0, 0, 36)
    fBtn.Position = UDim2.new(0, 0, 0, yPos)
    fBtn.BackgroundColor3 = (lang.code == currentLang) and Color3.fromRGB(120, 20, 35) or Color3.fromRGB(18, 14, 18)
    fBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    fBtn.TextSize = 12
    fBtn.Font = Enum.Font.GothamMedium
    fBtn.Text = (lang.code == currentLang and "  ✓ " or "    ") .. lang.flag .. "  " .. lang.name
    fBtn.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", fBtn).CornerRadius = UDim.new(0, 8)
    
    table.insert(flagButtons, {code = lang.code, name = lang.name, flag = lang.flag, obj = fBtn})
    
    fBtn.MouseButton1Click:Connect(function()
        updateLanguage(lang.code)
    end)
    
    yPos = yPos + 42
end
LangsScroll.CanvasSize = UDim2.new(0, 0, 0, yPos)

-- ==========================================
-- 7. ANIMACIÓN DE CARGA AUTOMÁTICA
-- ==========================================
task.spawn(function()
    for i = 1, 100 do
        BarFill.Size = UDim2.new(i / 100, 0, 1, 0)
        PercentText.Text = i .. "%"
        
        if i == 25 then
            LogText.Text = "> system.boot()\n> loading core scripts..."
        elseif i == 50 then
            LogText.Text = "> system.boot()\n> bypassing security checks..."
        elseif i == 75 then
            LogText.Text = "> system.boot()\n> initializing user interface..."
        elseif i == 95 then
            LogText.Text = "> system.boot()\n> ready! launching hub..."
        end
        
        task.wait(0.02)
    end
    
    local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local fadeOut = TweenService:Create(LoadingFrame, tweenInfo, {BackgroundTransparency = 1})
    
    fadeOut:Play()
    for _, obj in pairs(LoadingFrame:GetChildren()) do
        if obj:IsA("GuiObject") then
            TweenService:Create(obj, tweenInfo, {BackgroundTransparency = 1}):Play()
            if obj:IsA("TextLabel") then
                TweenService:Create(obj, tweenInfo, {TextTransparency = 1}):Play()
            end
        end
    end
    
    task.wait(0.6)
    LoadingFrame:Destroy()
    
    MainFrame.Visible = true
    ToggleButton.Visible = true
    if Config.FOVVisible then
        FOVCircleFrame.Visible = true
    end
    notify(L("loaded"))
end)

-- ==========================================
-- 8. FUNCIONES DE JUEGO (FILTRADAS CORRECTAMENTE)
-- ==========================================
local function isTeamMate(player)
    if not Config.TeamCheck then return false end
    if player.Team and localPlayer.Team and player.Team == localPlayer.Team then return true end
    return false
end

RunService.Stepped:Connect(function(_, deltaTime)
    pcall(function()
        if Config.Noclip then
            local char = localPlayer.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end

        if Config.RobaTpWalk then
            local char = localPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") then
                local hum = char:FindFirstChildOfClass("Humanoid")
                local hrp = char.HumanoidRootPart
                if hum.MoveDirection.Magnitude > 0 then
                    hrp.CFrame = hrp.CFrame + (hum.MoveDirection * (Config.RobaTpSpeed * deltaTime))
                end
            end
        end
    end)
end)

RunService.Heartbeat:Connect(function()
    pcall(function()
        local char = localPlayer.Character
        if char then
            if Config.FullBright then 
                game:GetService("Lighting").Brightness = 2 
                game:GetService("Lighting").GlobalShadows = false 
            end
            
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.Transparency = Config.Invisibility and 1 or 0
                elseif part:IsA("Decal") then
                    part.Transparency = Config.Invisibility and 1 or 0
                end
            end
        end
        
        if Config.AimbotUniversal then
            local closest = nil
            local shortestDist = Config.FOVRadius
            local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= localPlayer and not isTeamMate(p) and p.Character and p.Character:FindFirstChild(Config.AimPart) then
                    local part = p.Character[Config.AimPart]
                    local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local dist = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
                        if dist <= shortestDist then shortestDist = dist closest = part end
                    end
                end
            end
            if closest then Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest.Position) end
        end
        
        local currentHitboxSize = sizeValues[Config.HitboxSizeIdx]
        local currentHitboxColor = colorValues[Config.HitboxColorIdx]

        for _, p in pairs(Players:GetPlayers()) do
            if p ~= localPlayer and p.Character then
                local enemyChar = p.Character
                local humanoid = enemyChar:FindFirstChildOfClass("Humanoid")
                local enemyHrp = enemyChar:FindFirstChild("HumanoidRootPart")
                
                if humanoid and humanoid.Health > 0 and enemyHrp then
                    if Config.WallESP and not isTeamMate(p) then
                        local hl = enemyChar:FindFirstChild("WallESPHighlight")
                        if not hl then
                            hl = Instance.new("Highlight")
                            hl.Name = "WallESPHighlight"
                            hl.Adornee = enemyChar
                            hl.FillColor = Color3.fromRGB(255, 40, 50)
                            hl.FillTransparency = 0.3
                            hl.OutlineTransparency = 0
                            hl.Parent = enemyChar
                        end
                    else
                        if enemyChar:FindFirstChild("WallESPHighlight") then enemyChar.WallESPHighlight:Destroy() end
                    end
                    
                    if Config.HitboxExpander and not isTeamMate(p) then
                        enemyHrp.Size = Vector3.new(currentHitboxSize, currentHitboxSize, currentHitboxSize)
                        enemyHrp.Transparency = 0.5
                        enemyHrp.Color = currentHitboxColor
                        enemyHrp.Material = Enum.Material.Neon
                        enemyHrp.CanCollide = false
                    else
                        enemyHrp.Size = Vector3.new(2, 2, 1)
                        enemyHrp.Transparency = 1
                        enemyHrp.Material = Enum.Material.Plastic
                    end
                end
            end
        end
    end)
end)

-- ⚫ MJ 1.0 | Destrua a Vovó | by Mikael_n244br
-- ESP Vovó, Neto, Chaves, Portas, Objetos do Baú

local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local T=game:GetService("TweenService")
local VU=game:GetService("VirtualUser")
local p=P.LocalPlayer
local cam=workspace.CurrentCamera
local CRIADOR="Mikael_n244br"

local container=p:WaitForChild("PlayerGui")
for _,g in ipairs(container:GetChildren()) do
    if g.Name=="MJ" or g.Name=="MJLoading" then g:Destroy() end
end

local BRANCO=Color3.fromRGB(255,255,255)
local CINZA=Color3.fromRGB(200,200,220)
local FUNDO=Color3.fromRGB(5,5,10)

local LISTA_CORES={
 {n="Branco",c=Color3.fromRGB(255,255,255)},
 {n="Amarelo",c=Color3.fromRGB(255,255,0)},
 {n="Verde",c=Color3.fromRGB(0,255,0)},
 {n="Vermelho",c=Color3.fromRGB(255,0,0)},
 {n="Azul",c=Color3.fromRGB(0,150,255)},
 {n="Roxo",c=Color3.fromRGB(180,0,255)},
 {n="Rosa",c=Color3.fromRGB(255,0,180)},
 {n="Ciano",c=Color3.fromRGB(0,255,255)},
 {n="Laranja",c=Color3.fromRGB(255,130,0)},
 {n="Rainbow",c="rainbow"},
}

local st={
 noclip=false,speed=16,
 espVovo=false,corVovo=1,
 espNeto=false,corNeto=1,
 espChave=false,corChave=1,
 espPorta=false,corPorta=1,
 espBau=false,corBau=1,
 alertaVovo=false,
 miraVovo=false,miraNeto=false,
 miraNome=false,miraNomeAlvo="",
 arremessarVovo=false,arremessarNeto=false,
 rage=false,rageSize=2,
}

local MENU_SIZES={
 {n="Mini",w=220,h=280},
 {n="Normal",w=280,h=360},
 {n="Grande",w=380,h=480},
 {n="Max",w=500,h=650},
}
local menuIdx=2

local function getCor(idx)
 local c=LISTA_CORES[idx].c
 if c=="rainbow" then return Color3.fromHSV(tick()*0.4%1,1,1) end
 return c
end

local function criarConstelacao(parent,quantidade,tamEstrela,transLinha)
 local stars={}
 for c=1,quantidade do
  local bx=math.random(5,85)/100
  local by=math.random(5,85)/100
  local n=math.random(3,5)
  local grupo={}
  for i=1,n do
   local s=Instance.new("Frame",parent)
   s.Size=UDim2.new(0,math.random(2,tamEstrela),0,math.random(2,tamEstrela))
   s.Position=UDim2.new(bx+math.random(-8,8)/100,0,by+math.random(-8,8)/100,0)
   s.BackgroundColor3=BRANCO
   s.BackgroundTransparency=math.random(20,50)/100
   s.BorderSizePixel=0
   Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
   table.insert(grupo,s)
   table.insert(stars,s)
  end
  for i=1,#grupo-1 do
   local a=grupo[i] local b=grupo[i+1]
   local ax,ay=a.Position.X.Scale*100,a.Position.Y.Scale*100
   local bx2,by2=b.Position.X.Scale*100,b.Position.Y.Scale*100
   local dx,dy=bx2-ax,by2-ay
   local dist=math.sqrt(dx*dx+dy*dy)
   local ang=math.deg(math.atan2(dy,dx))
   local line=Instance.new("Frame",parent)
   line.Size=UDim2.new(0,dist*3.2,0,1)
   line.Position=UDim2.new(ax/100,0,ay/100,0)
   line.Rotation=ang
   line.BackgroundColor3=BRANCO
   line.BackgroundTransparency=transLinha or 0.75
   line.BorderSizePixel=0
   table.insert(stars,line)
  end
 end
 return stars
end

-- LOADING
local loadGui=Instance.new("ScreenGui")
loadGui.Name="MJLoading"
loadGui.ResetOnSpawn=false
loadGui.IgnoreGuiInset=true
loadGui.DisplayOrder=20000
loadGui.Parent=container

local lBg=Instance.new("Frame",loadGui)
lBg.Size=UDim2.new(1,0,1,0)
lBg.BackgroundColor3=FUNDO

local loadStars=criarConstelacao(lBg,10,3,0.75)

local lTitle=Instance.new("TextLabel",lBg)
lTitle.Size=UDim2.new(0,500,0,60)
lTitle.Position=UDim2.new(0.5,-250,0.5,-50)
lTitle.BackgroundTransparency=1
lTitle.Text="⚫ MJ 1.0 ⚫"
lTitle.TextColor3=BRANCO
lTitle.Font=Enum.Font.GothamBold
lTitle.TextSize=42
lTitle.TextTransparency=1

local lSub=Instance.new("TextLabel",lBg)
lSub.Size=UDim2.new(0,500,0,20)
lSub.Position=UDim2.new(0.5,-250,0.5,10)
lSub.BackgroundTransparency=1
lSub.Text="by "..CRIADOR
lSub.TextColor3=CINZA
lSub.Font=Enum.Font.Gotham
lSub.TextSize=12
lSub.TextTransparency=1

local lBarBg=Instance.new("Frame",lBg)
lBarBg.Size=UDim2.new(0,200,0,3)
lBarBg.Position=UDim2.new(0.5,-100,0.5,45)
lBarBg.BackgroundColor3=Color3.fromRGB(30,30,40)

local lBar=Instance.new("Frame",lBarBg)
lBar.Size=UDim2.new(0,0,1,0)
lBar.BackgroundColor3=BRANCO

task.spawn(function()
 for i=1,15 do
  lTitle.TextTransparency=1-i/15
  lSub.TextTransparency=1-i/15
  task.wait(0.02)
 end
 for i=1,25 do
  lBar.Size=UDim2.new(i/25,0,1,0)
  task.wait(0.02)
 end
 task.wait(0.15)
 for i=1,10 do
  local a=i/10
  lTitle.TextTransparency=a
  lSub.TextTransparency=a
  lBg.BackgroundTransparency=a
  for _,s in ipairs(loadStars) do
   if s.Parent then s.BackgroundTransparency=math.min(1,s.BackgroundTransparency+a) end
  end
  task.wait(0.02)
 end
 loadGui:Destroy()
end)

task.wait(2.2)

-- GUI
local gui=Instance.new("ScreenGui")
gui.Name="MJ"
gui.ResetOnSpawn=false
gui.IgnoreGuiInset=true
gui.DisplayOrder=9999
gui.Parent=container

local alertaGui=Instance.new("ScreenGui")
alertaGui.Name="MJAlerta"
alertaGui.ResetOnSpawn=false
alertaGui.IgnoreGuiInset=true
alertaGui.DisplayOrder=15000
alertaGui.Parent=container

local alertaFrame=Instance.new("Frame",alertaGui)
alertaFrame.Size=UDim2.new(1,0,1,0)
alertaFrame.BackgroundColor3=Color3.fromRGB(255,0,0)
alertaFrame.BackgroundTransparency=1
alertaFrame.BorderSizePixel=0

local function piscarVermelho()
 task.spawn(function()
  for i=1,3 do
   TweenService:Create(alertaFrame,TweenInfo.new(0.15),{BackgroundTransparency=0.5}):Play()
   task.wait(0.2)
   TweenService:Create(alertaFrame,TweenInfo.new(0.15),{BackgroundTransparency=1}):Play()
   task.wait(0.2)
  end
 end)
end

-- BOLINHA
local ball=Instance.new("TextButton")
ball.Size=UDim2.new(0,55,0,55)
ball.Position=UDim2.new(0,15,0.5,-27)
ball.BackgroundColor3=Color3.fromRGB(5,5,10)
ball.Text=""
ball.BorderSizePixel=0
ball.Active=true
ball.AutoButtonColor=false
ball.ZIndex=100
ball.Parent=gui
Instance.new("UICorner",ball).CornerRadius=UDim.new(1,0)
local bStroke=Instance.new("UIStroke",ball)
bStroke.Color=BRANCO
bStroke.Thickness=2

local ballConstStars={}
for i=1,10 do
 local s=Instance.new("Frame",ball)
 s.Size=UDim2.new(0,math.random(1,2),0,math.random(1,2))
 s.Position=UDim2.new(math.random()*80/100,0,math.random()*80/100,0)
 s.BackgroundColor3=BRANCO
 s.BackgroundTransparency=math.random(10,40)/100
 s.BorderSizePixel=0
 s.ZIndex=101
 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
 table.insert(ballConstStars,s)
end
for i=1,5 do
 local line=Instance.new("Frame",ball)
 line.Size=UDim2.new(0,math.random(10,18),0,1)
 line.Position=UDim2.new(math.random()*70/100,0,math.random()*70/100,0)
 line.BackgroundColor3=BRANCO
 line.BackgroundTransparency=0.5
 line.BorderSizePixel=0
 line.Rotation=math.random(-60,60)
 line.ZIndex=100
end
local ballTxt=Instance.new("TextLabel",ball)
ballTxt.Size=UDim2.new(1,0,1,0)
ballTxt.BackgroundTransparency=1
ballTxt.Text="MJ"
ballTxt.TextColor3=BRANCO
ballTxt.TextStrokeColor3=Color3.fromRGB(0,0,0)
ballTxt.TextStrokeTransparency=0.3
ballTxt.Font=Enum.Font.GothamBold
ballTxt.TextSize=16
ballTxt.ZIndex=105

task.spawn(function()
 while ball.Parent do
  for _,s in ipairs(ballConstStars) do
   s.BackgroundTransparency=math.random(10,50)/100
  end
  task.wait(0.5)
 end
end)

-- MENU
local menu=Instance.new("Frame")
menu.Size=UDim2.new(0,MENU_SIZES[menuIdx].w,0,MENU_SIZES[menuIdx].h)
menu.Position=UDim2.new(0,70,0.5,-180)
menu.BackgroundColor3=FUNDO
menu.BorderSizePixel=0
menu.Visible=false
menu.Active=true
menu.ZIndex=200
menu.Parent=gui
Instance.new("UICorner",menu).CornerRadius=UDim.new(0,10)
Instance.new("UIStroke",menu).Color=BRANCO
Instance.new("UIStroke",menu).Thickness=1.5

local menuStars=criarConstelacao(menu,5,2,0.8)
for _,s in ipairs(menuStars) do s.ZIndex=201 end
task.spawn(function()
 while menu.Parent do
  for _,s in ipairs(menuStars) do
   if s.Parent and s:IsA("Frame") and s.Size.X.Offset<=2 then
    s.BackgroundTransparency=math.random(50,85)/100
   end
  end
  task.wait(0.6)
 end
end)

local title=Instance.new("TextLabel",menu)
title.Size=UDim2.new(1,0,0,26)
title.BackgroundColor3=Color3.fromRGB(30,30,30)
title.BackgroundTransparency=0.4
title.Text="⚫ MJ 1.0 ⚫"
title.TextColor3=BRANCO
title.Font=Enum.Font.GothamBold
title.TextSize=12
title.BorderSizePixel=0
title.ZIndex=203
Instance.new("UICorner",title).CornerRadius=UDim.new(0,10)

local btnUp=Instance.new("TextButton",menu)
btnUp.Size=UDim2.new(0,20,0,20)
btnUp.Position=UDim2.new(1,-70,0,3)
btnUp.BackgroundColor3=Color3.fromRGB(50,120,50)
btnUp.Text="+"
btnUp.TextColor3=BRANCO
btnUp.Font=Enum.Font.GothamBold
btnUp.TextSize=14
btnUp.BorderSizePixel=0
btnUp.ZIndex=205
Instance.new("UICorner",btnUp).CornerRadius=UDim.new(0,3)

local btnDown=Instance.new("TextButton",menu)
btnDown.Size=UDim2.new(0,20,0,20)
btnDown.Position=UDim2.new(1,-48,0,3)
btnDown.BackgroundColor3=Color3.fromRGB(120,50,50)
btnDown.Text="-"
btnDown.TextColor3=BRANCO
btnDown.Font=Enum.Font.GothamBold
btnDown.TextSize=14
btnDown.BorderSizePixel=0
btnDown.ZIndex=205
Instance.new("UICorner",btnDown).CornerRadius=UDim.new(0,3)

local closeBtn=Instance.new("TextButton",menu)
closeBtn.Size=UDim2.new(0,20,0,20)
closeBtn.Position=UDim2.new(1,-24,0,3)
closeBtn.BackgroundColor3=Color3.fromRGB(200,30,60)
closeBtn.Text="X"
closeBtn.TextColor3=BRANCO
closeBtn.Font=Enum.Font.GothamBold
closeBtn.TextSize=11
closeBtn.BorderSizePixel=0
closeBtn.ZIndex=205
Instance.new("UICorner",closeBtn).CornerRadius=UDim.new(0,3)
closeBtn.MouseButton1Click:Connect(function() menu.Visible=false end)

local function aplicarTamanho()
 local s=MENU_SIZES[menuIdx]
 menu.Size=UDim2.new(0,s.w,0,s.h)
end

btnUp.MouseButton1Click:Connect(function()
 if menuIdx<#MENU_SIZES then menuIdx=menuIdx+1 aplicarTamanho() end
end)
btnDown.MouseButton1Click:Connect(function()
 if menuIdx>1 then menuIdx=menuIdx-1 aplicarTamanho() end
end)

-- ABAS
local TABS={"Geral","ESP","Mira"}
local tabBtns={}
local tabFrames={}

local contentArea=Instance.new("Frame",menu)
contentArea.Size=UDim2.new(1,-8,1,-75)
contentArea.Position=UDim2.new(0,4,0,68)
contentArea.BackgroundTransparency=1
contentArea.ZIndex=203

local function mostrarTab(i)
 for j=1,#tabFrames do
  tabFrames[j].Visible=(j==i)
  tabBtns[j].BackgroundColor3=(j==i) and Color3.fromRGB(80,80,80) or Color3.fromRGB(25,25,25)
  tabBtns[j].TextColor3=(j==i) and BRANCO or CINZA
 end
end

for i,nome in ipairs(TABS) do
 local b=Instance.new("TextButton",menu)
 b.Size=UDim2.new(0.333,-2,0,22)
 b.Position=UDim2.new((i-1)*0.333+0.005,0,0,40)
 b.BackgroundColor3=Color3.fromRGB(25,25,25)
 b.Text=nome
 b.TextColor3=CINZA
 b.Font=Enum.Font.GothamBold
 b.TextSize=9
 b.BorderSizePixel=0
 b.ZIndex=205
 b.Active=true
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)
 table.insert(tabBtns,b)
 
 local c=Instance.new("ScrollingFrame",contentArea)
 c.Size=UDim2.new(1,0,1,0)
 c.BackgroundTransparency=1
 c.BorderSizePixel=0
 c.ScrollBarThickness=2
 c.ScrollBarImageColor3=BRANCO
 c.CanvasSize=UDim2.new(0,0,0,0)
 c.AutomaticCanvasSize=Enum.AutomaticSize.Y
 c.Visible=(i==1)
 c.ZIndex=204
 table.insert(tabFrames,c)
 
 b.MouseButton1Click:Connect(function() mostrarTab(i) end)
end
mostrarTab(1)

-- Helpers
local function addT(par,y,txt,fn)
 local b=Instance.new("TextButton",par)
 b.Size=UDim2.new(1,-6,0,24)
 b.Position=UDim2.new(0,3,0,y)
 b.BackgroundColor3=Color3.fromRGB(25,25,25)
 b.Text=txt.."  ⭕"
 b.TextColor3=BRANCO
 b.Font=Enum.Font.GothamBold
 b.TextSize=9
 b.BorderSizePixel=0
 b.ZIndex=205
 b.Active=true
 b.AutoButtonColor=false
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)
 local est=false
 b.MouseButton1Click:Connect(function()
  est=not est
  b.Text=txt..(est and "  ✅" or "  ⭕")
  b.BackgroundColor3=est and Color3.fromRGB(80,80,80) or Color3.fromRGB(25,25,25)
  fn(est)
 end)
 return b
end

local function addB(par,y,txt,fn)
 local b=Instance.new("TextButton",par)
 b.Size=UDim2.new(1,-6,0,24)
 b.Position=UDim2.new(0,3,0,y)
 b.BackgroundColor3=Color3.fromRGB(50,50,50)
 b.Text=txt
 b.TextColor3=BRANCO
 b.Font=Enum.Font.GothamBold
 b.TextSize=9
 b.BorderSizePixel=0
 b.ZIndex=205
 b.Active=true
 b.AutoButtonColor=false
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)
 b.MouseButton1Click:Connect(function()
  b.BackgroundColor3=Color3.fromRGB(100,100,100)
  task.wait(0.1)
  b.BackgroundColor3=Color3.fromRGB(50,50,50)
  fn()
 end)
 return b
end

local function addInput(par,y,ph,fn)
 local t=Instance.new("TextBox",par)
 t.Size=UDim2.new(1,-6,0,24)
 t.Position=UDim2.new(0,3,0,y)
 t.BackgroundColor3=Color3.fromRGB(25,25,25)
 t.Text=""
 t.PlaceholderText=ph
 t.PlaceholderColor3=CINZA
 t.TextColor3=BRANCO
 t.Font=Enum.Font.Code
 t.TextSize=10
 t.BorderSizePixel=0
 t.ZIndex=205
 t.ClearTextOnFocus=false
 Instance.new("UICorner",t).CornerRadius=UDim.new(0,4)
 t.FocusLost:Connect(function()
  fn(t.Text)
 end)
 return t
end

local function addEspCategory(par,y,titulo,stateKey,corKey)
 local header=Instance.new("TextButton",par)
 header.Size=UDim2.new(1,-6,0,24)
 header.Position=UDim2.new(0,3,0,y)
 header.BackgroundColor3=Color3.fromRGB(40,40,60)
 header.Text="▶ "..titulo
 header.TextColor3=BRANCO
 header.Font=Enum.Font.GothamBold
 header.TextSize=9
 header.TextXAlignment=Enum.TextXAlignment.Left
 header.BorderSizePixel=0
 header.ZIndex=205
 header.Active=true
 header.AutoButtonColor=false
 Instance.new("UICorner",header).CornerRadius=UDim.new(0,4)
 
 local submenu=Instance.new("Frame",par)
 submenu.Size=UDim2.new(1,-12,0,56)
 submenu.Position=UDim2.new(0,6,0,y+26)
 submenu.BackgroundColor3=Color3.fromRGB(15,15,25)
 submenu.BorderSizePixel=0
 submenu.Visible=false
 submenu.ZIndex=204
 Instance.new("UICorner",submenu).CornerRadius=UDim.new(0,4)
 
 local toggle=Instance.new("TextButton",submenu)
 toggle.Size=UDim2.new(1,-6,0,22)
 toggle.Position=UDim2.new(0,3,0,3)
 toggle.BackgroundColor3=Color3.fromRGB(25,25,25)
 toggle.Text="Ativar ESP   ⭕"
 toggle.TextColor3=BRANCO
 toggle.Font=Enum.Font.GothamBold
 toggle.TextSize=9
 toggle.BorderSizePixel=0
 toggle.ZIndex=205
 toggle.Active=true
 toggle.AutoButtonColor=false
 Instance.new("UICorner",toggle).CornerRadius=UDim.new(0,4)
 
 local corBtn=Instance.new("TextButton",submenu)
 corBtn.Size=UDim2.new(1,-6,0,22)
 corBtn.Position=UDim2.new(0,3,0,28)
 local cor=LISTA_CORES[st[corKey]]
 corBtn.BackgroundColor3=(cor.c=="rainbow") and Color3.fromRGB(150,50,200) or cor.c
 corBtn.Text="🎨 "..cor.n
 corBtn.TextColor3=((cor.c=="rainbow") or (cor.c.R+cor.c.G+cor.c.B<300)) and BRANCO or Color3.fromRGB(0,0,0)
 corBtn.Font=Enum.Font.GothamBold
 corBtn.TextSize=9
 corBtn.BorderSizePixel=0
 corBtn.ZIndex=205
 corBtn.Active=true
 corBtn.Visible=false
 Instance.new("UICorner",corBtn).CornerRadius=UDim.new(0,4)
 corBtn.MouseButton1Click:Connect(function()
  st[corKey]=st[corKey]+1
  if st[corKey]>#LISTA_CORES then st[corKey]=1 end
  local c=LISTA_CORES[st[corKey]]
  corBtn.Text="🎨 "..c.n
  if c.c=="rainbow" then
   corBtn.BackgroundColor3=Color3.fromRGB(150,50,200)
   corBtn.TextColor3=BRANCO
  else
   corBtn.BackgroundColor3=c.c
   corBtn.TextColor3=(c.c.R+c.c.G+c.c.B<300) and BRANCO or Color3.fromRGB(0,0,0)
  end
 end)
 
 local aberto=false
 header.MouseButton1Click:Connect(function()
  aberto=not aberto
  submenu.Visible=aberto
  header.Text=(aberto and "▼ " or "▶ ")..titulo
 end)
 toggle.MouseButton1Click:Connect(function()
  local v=not st[stateKey]
  st[stateKey]=v
  toggle.Text="Ativar ESP  "..(v and "✅" or " ⭕")
  toggle.BackgroundColor3=v and Color3.fromRGB(80,80,80) or Color3.fromRGB(25,25,25)
  corBtn.Visible=v
 end)
end

-- DETECÇÃO
local function sChar(m)
 if not m then return 0 end
 local h=m:FindFirstChild("HumanoidRootPart")
 if not h then return 0 end
 return math.max(h.Size.X,h.Size.Y,h.Size.Z)
end

local vRef=nil
local function acharV()
 if vRef and vRef.Parent then
  local h=vRef:FindFirstChildOfClass("Humanoid")
  if h and h.Health>0 then return vRef end
 end
 local maior,tam=nil,0
 for _,j in ipairs(P:GetPlayers()) do
  if j~=p and j.Character then
   local h=j.Character:FindFirstChildOfClass("Humanoid")
   if h and h.Health>0 then
    local s=sChar(j.Character)
    if s>tam then maior,tam=j.Character,s end
   end
  end
 end
 vRef=maior
 return maior
end

local function acharTodosNetos()
 local netos={}
 local v=acharV()
 for _,j in ipairs(P:GetPlayers()) do
  if j~=p and j.Character and j.Character~=v then
   local h=j.Character:FindFirstChildOfClass("Humanoid")
   if h and h.Health>0 then
    table.insert(netos,{plr=j,char=j.Character,tam=sChar(j.Character)})
   end
  end
 end
 return netos
end

-- 🎁 FUNÇÃO: Achar baús
local function acharBaus()
 local baus={}
 for _,o in ipairs(workspace:GetDescendants()) do
  local n=o.Name:lower()
  if (n:find("chest") or n:find("bau") or n:find("caixa") or n:find("treasure") or n:find("crate")) and (o:IsA("BasePart") or o:IsA("Model")) then
   table.insert(baus,o)
  end
 end
 return baus
end

-- 🎁 FUNÇÃO: Achar objetos DENTRO do baú
local function getObjetosDentroBau(bau)
 local objetos={}
 -- Procura Tools, BaseParts, Models dentro do baú
 for _,o in ipairs(bau:GetDescendants()) do
  if o:IsA("Tool") or (o:IsA("BasePart") and o~=bau and o.Name~=bau.Name) then
   table.insert(objetos,o)
  elseif o:IsA("Model") then
   -- Model dentro do baú
   table.insert(objetos,o)
  end
 end
 return objetos
end

-- MIRA POR NOME
local alvoNomeRef=nil
local function acharPorNome(nome)
 if nome=="" then return nil end
 if alvoNomeRef and alvoNomeRef.Parent then
  local h=alvoNomeRef:FindFirstChildOfClass("Humanoid")
  if h and h.Health>0 then return alvoNomeRef end
 end
 for _,j in ipairs(P:GetPlayers()) do
  if j.Name:lower()==nome:lower() and j.Character then
   alvoNomeRef=j.Character
   return j.Character
  end
 end
 return nil
end

-- ARREMESSAR
local function getTool()
 local c=p.Character
 if not c then return nil end
 for _,t in ipairs(c:GetChildren()) do
  if t:IsA("Tool") then return t end
 end
 return nil
end

local function clicarMouse()
 pcall(function() mouse1click() end)
 task.wait(0.02)
 pcall(function()
  mouse1press()
  task.wait(0.05)
  mouse1release()
 end)
 task.wait(0.02)
 pcall(function()
  VU:Button1Down(Vector2.new(0,0),cam.CFrame)
  task.wait(0.05)
  VU:Button1Up(Vector2.new(0,0),cam.CFrame)
 end)
end

local function arremessar(alvo)
 local c=p.Character
 if not c then return end
 local root=c:FindFirstChild("HumanoidRootPart")
 if not root then return end
 local tool=getTool()
 if not tool then return end
 local hr=alvo:FindFirstChild("HumanoidRootPart") or alvo:FindFirstChild("Head")
 if not hr then return end
 cam.CFrame=CFrame.lookAt(cam.CFrame.Position,hr.Position)
 task.wait(0.02)
 local flat=Vector3.new(hr.Position.X,root.Position.Y,hr.Position.Z)
 root.CFrame=CFrame.lookAt(root.Position,flat)
 task.wait(0.02)
 pcall(function() tool:Activate() end)
 task.wait(0.05)
 clicarMouse()
end

-- LÓGICAS
R.Stepped:Connect(function()
 if st.noclip then
  local c=p.Character
  if c then for _,x in ipairs(c:GetDescendants()) do
   if x:IsA("BasePart") then x.CanCollide=false end
  end end
 end
end)

R:BindToRenderStep("MJA",201,function()
 if st.miraVovo then
  local v=acharV()
  if v then
   local h=v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Head")
   if h then cam.CFrame=CFrame.lookAt(cam.CFrame.Position,h.Position) end
  end
 end
 if st.miraNeto then
  local netos=acharTodosNetos()
  if #netos>0 then
   local c=p.Character
   local root=c and c:FindFirstChild("HumanoidRootPart")
   if root then
    local perto,dist=nil,math.huge
    for _,info in ipairs(netos) do
     local hr=info.char:FindFirstChild("HumanoidRootPart")
     if hr then
      local d=(root.Position-hr.Position).Magnitude
      if d<dist then perto,dist=info.char,d end
     end
    end
    if perto then
     local h=perto:FindFirstChild("HumanoidRootPart") or perto:FindFirstChild("Head")
     if h then cam.CFrame=CFrame.lookAt(cam.CFrame.Position,h.Position) end
    end
   end
  end
 end
 if st.miraNome then
  local alvo=acharPorNome(st.miraNomeAlvo)
  if alvo then
   local h=alvo:FindFirstChild("HumanoidRootPart") or alvo:FindFirstChild("Head")
   if h then cam.CFrame=CFrame.lookAt(cam.CFrame.Position,h.Position) end
  end
 end
end)

local gHL,gBB
local function espV(c,cor,txt)
 if not c or not c.Parent then return end
 if gHL and gHL.Parent then
  gHL.Adornee=c
  gHL.FillColor=cor
  gHL.OutlineColor=cor
 else
  gHL=Instance.new("Highlight",c)
  gHL.Name="MJHV"
  gHL.Adornee=c
  gHL.FillColor=cor
  gHL.FillTransparency=0.75
  gHL.OutlineColor=cor
  gHL.OutlineTransparency=0
  gHL.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
 end
 local h=c:FindFirstChild("Head") or c:FindFirstChild("HumanoidRootPart")
 if h then
  if gBB and gBB.Parent then
   gBB.Parent=h
  else
   gBB=Instance.new("BillboardGui",h)
   gBB.Size=UDim2.new(0,110,0,14)
   gBB.StudsOffset=Vector3.new(0,3,0)
   gBB.AlwaysOnTop=true
   local t=Instance.new("TextLabel",gBB)
   t.Size=UDim2.new(1,0,1,0)
   t.BackgroundTransparency=1
   t.TextColor3=cor
   t.TextStrokeColor3=Color3.fromRGB(0,0,0)
   t.TextStrokeTransparency=0
   t.TextScaled=true
   t.Font=Enum.Font.GothamBold
   t.Name="T"
  end
  local t=gBB:FindFirstChild("T")
  if t then
   t.Text="👵 "..txt
   t.TextColor3=cor
  end
 end
end

local function remV()
 if gHL and gHL.Parent then gHL:Destroy() end
 if gBB and gBB.Parent then gBB:Destroy() end
 gHL,gBB=nil,nil
end

task.spawn(function()
 while true do
  local c=p.Character
  if c then
   local hum=c:FindFirstChildOfClass("Humanoid")
   if hum then
    pcall(function()
     if st.rage then
      hum.BodyDepthScale.Value=st.rageSize
      hum.BodyHeightScale.Value=st.rageSize
      hum.BodyWidthScale.Value=st.rageSize
      hum.HeadScale.Value=st.rageSize
     elseif hum.BodyDepthScale.Value~=1 then
      hum.BodyDepthScale.Value=1
      hum.BodyHeightScale.Value=1
      hum.BodyWidthScale.Value=1
      hum.HeadScale.Value=1
     end
    end)
   end
  end
  task.wait(0.5)
 end
end)

local ultAlerta=0
task.spawn(function()
 while true do
  if st.alertaVovo then
   local v=acharV()
   local c=p.Character
   if v and c then
    local mr=c:FindFirstChild("HumanoidRootPart")
    local vr=v:FindFirstChild("HumanoidRootPart")
    if mr and vr then
     local d=(mr.Position-vr.Position).Magnitude
     if d<40 and tick()-ultAlerta>3 then
      ultAlerta=tick()
      piscarVermelho()
     end
    end
   end
  end
  task.wait(0.3)
 end
end)

task.spawn(function()
 while true do
  if st.arremessarVovo then
   local v=acharV()
   if v then arremessar(v) end
  end
  if st.arremessarNeto then
   local netos=acharTodosNetos()
   local c=p.Character
   local root=c and c:FindFirstChild("HumanoidRootPart")
   if #netos>0 and root then
    local perto,dist=nil,math.huge
    for _,info in ipairs(netos) do
     local hr=info.char:FindFirstChild("HumanoidRootPart")
     if hr then
      local d=(root.Position-hr.Position).Magnitude
      if d<dist then perto,dist=info.char,d end
     end
    end
    if perto then arremessar(perto) end
   end
  end
  task.wait(0.4)
 end
end)

-- ESP LOOP
task.spawn(function()
 while true do
  local corV=getCor(st.corVovo)
  local corN=getCor(st.corNeto)
  local corC=getCor(st.corChave)
  local corP=getCor(st.corPorta)
  local corB=getCor(st.corBau)
  
  -- Vovó
  if st.espVovo then
   local v=acharV()
   if v then
    local pl=P:GetPlayerFromCharacter(v)
    espV(v,corV,(pl and pl.Name or v.Name))
   end
  else remV() end
  
  -- Netos
  if st.espNeto then
   local netos=acharTodosNetos()
   for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="MJNeto" or o.Name=="MJNetoBB" then
     local dono=o.Parent
     local ok=false
     for _,info in ipairs(netos) do
      if info.char==dono then ok=true break end
     end
     if not ok then o:Destroy() end
    end
   end
   for _,info in ipairs(netos) do
    local char=info.char
    if char and char.Parent then
     if not char:FindFirstChild("MJNeto") then
      local hl=Instance.new("Highlight",char)
      hl.Name="MJNeto"
      hl.FillColor=corN
      hl.OutlineColor=corN
      hl.FillTransparency=0.75
      hl.OutlineTransparency=0
      hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
     else
      local hl=char:FindFirstChild("MJNeto")
      hl.FillColor=corN
      hl.OutlineColor=corN
     end
     local head=char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
     if head and not head:FindFirstChild("MJNetoBB") then
      local bb=Instance.new("BillboardGui",head)
      bb.Name="MJNetoBB"
      bb.Size=UDim2.new(0,110,0,14)
      bb.StudsOffset=Vector3.new(0,2.5,0)
      bb.AlwaysOnTop=true
      local t=Instance.new("TextLabel",bb)
      t.Size=UDim2.new(1,0,1,0)
      t.BackgroundTransparency=1
      t.Text="👶 "..info.plr.Name
      t.TextColor3=corN
      t.TextStrokeColor3=Color3.fromRGB(0,0,0)
      t.TextStrokeTransparency=0
      t.TextScaled=true
      t.Font=Enum.Font.GothamBold
      t.Name="T"
     elseif head then
      local bb=head:FindFirstChild("MJNetoBB")
      if bb then
       local t=bb:FindFirstChild("T")
       if t then t.TextColor3=corN end
      end
     end
    end
   end
  else
   for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="MJNeto" or o.Name=="MJNetoBB" then o:Destroy() end
   end
  end
  
  -- 🎁 BAÚS + OBJETOS DENTRO
  if st.espBau then
   local baus=acharBaus()
   for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="MJBau" or o.Name=="MJBauBB" or o.Name=="MJBauItem" or o.Name=="MJBauItemBB" then
     local dono=o.Parent
     local ok=false
     for _,bau in ipairs(baus) do
      if bau==dono or bau:FindFirstChild(dono.Name) then ok=true break end
      for _,objDentro in ipairs(getObjetosDentroBau(bau)) do
       if objDentro==dono then ok=true break end
      end
     end
     if not ok then o:Destroy() end
    end
   end
   for _,bau in ipairs(baus) do
    -- ESP do baú em si
    local parteBau=bau
    if bau:IsA("Model") then
     parteBau=bau.PrimaryPart or bau:FindFirstChildWhichIsA("BasePart",true)
    end
    if parteBau and parteBau:IsA("BasePart") then
     if not parteBau:FindFirstChild("MJBau") then
      local hl=Instance.new("Highlight",parteBau)
      hl.Name="MJBau"
      hl.FillColor=corB
      hl.OutlineColor=corB
      hl.FillTransparency=0.6
      hl.OutlineTransparency=0
      hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
     end
     if not parteBau:FindFirstChild("MJBauBB") then
      local bb=Instance.new("BillboardGui",parteBau)
      bb.Name="MJBauBB"
      bb.Size=UDim2.new(0,120,0,14)
      bb.StudsOffset=Vector3.new(0,2,0)
      bb.AlwaysOnTop=true
      local t=Instance.new("TextLabel",bb)
      t.Size=UDim2.new(1,0,1,0)
      t.BackgroundTransparency=1
      t.Text="🎁 "..bau.Name
      t.TextColor3=corB
      t.TextStrokeColor3=Color3.fromRGB(0,0,0)
      t.TextStrokeTransparency=0
      t.TextScaled=true
      t.Font=Enum.Font.GothamBold
      t.Name="T"
     end
    end
    
    -- ESP dos objetos DENTRO do baú
    local objetosDentro=getObjetosDentroBau(bau)
    for _,obj in ipairs(objetosDentro) do
     if obj and obj.Parent then
      local parteObj=obj
      if obj:IsA("Model") or obj:IsA("Tool") then
       parteObj=obj:FindFirstChild("Handle") or obj:FindFirstChildWhichIsA("BasePart",true)
      end
      if parteObj and parteObj:IsA("BasePart") then
       if not parteObj:FindFirstChild("MJBauItem") then
        local hl=Instance.new("Highlight",parteObj)
        hl.Name="MJBauItem"
        hl.FillColor=corB
        hl.OutlineColor=corB
        hl.FillTransparency=0.5
        hl.OutlineTransparency=0
        hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
       end
       if not parteObj:FindFirstChild("MJBauItemBB") then
        local bb=Instance.new("BillboardGui",parteObj)
        bb.Name="MJBauItemBB"
        bb.Size=UDim2.new(0,100,0,14)
        bb.StudsOffset=Vector3.new(0,1.5,0)
        bb.AlwaysOnTop=true
        local t=Instance.new("TextLabel",bb)
        t.Size=UDim2.new(1,0,1,0)
        t.BackgroundTransparency=1
        t.Text="📦 "..obj.Name
        t.TextColor3=corB
        t.TextStrokeColor3=Color3.fromRGB(0,0,0)
        t.TextStrokeTransparency=0
        t.TextScaled=true
        t.Font=Enum.Font.GothamBold
       end
      end
     end
    end
   end
  else
   for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="MJBau" or o.Name=="MJBauBB" or o.Name=="MJBauItem" or o.Name=="MJBauItemBB" then o:Destroy() end
   end
  end
  
  -- Chaves
  if st.espChave then
   for _,o in ipairs(workspace:GetDescendants()) do
    if o:IsA("BasePart") and (o.Name:lower():find("key") or o.Name:lower():find("chave")) then
     if not o:FindFirstChild("MJK") then
      local hl=Instance.new("Highlight",o)
      hl.Name="MJK"
      hl.FillColor=corC
      hl.OutlineColor=corC
      hl.FillTransparency=0.75
      hl.OutlineTransparency=0
      hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
     end
    end
   end
  else
   for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="MJK" then o:Destroy() end
   end
  end
  
  -- Portas
  if st.espPorta then
   for _,o in ipairs(workspace:GetDescendants()) do
    if o:IsA("BasePart") and (o.Name:lower():find("door") or o.Name:lower():find("porta") or o.Name:lower():find("lock")) then
     if not o:FindFirstChild("MJP") then
      local hl=Instance.new("Highlight",o)
      hl.Name="MJP"
      hl.FillColor=corP
      hl.OutlineColor=corP
      hl.FillTransparency=0.75
      hl.OutlineTransparency=0
      hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
     end
    end
   end
  else
   for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="MJP" then o:Destroy() end
   end
  end
  
  task.wait(0.5)
 end
end)

-- ═══════ ABA GERAL ═══════
addT(tabFrames[1],3,"🚶 Noclip",function(v)
 st.noclip=v
 if not v then local c=p.Character
  if c then for _,x in ipairs(c:GetDescendants()) do
   if x:IsA("BasePart") then x.CanCollide=true end
  end end
 end
end)
addB(tabFrames[1],32,"⚡ Speed +16",function()
 st.speed=st.speed+16
 if st.speed>200 then st.speed=16 end
 local c=p.Character
 if c then local h=c:FindFirstChildOfClass("Humanoid")
  if h then h.WalkSpeed=st.speed end
 end
end)
addT(tabFrames[1],61,"💪 Rage (Hitbox)",function(v) st.rage=v end)
addT(tabFrames[1],90,"🔴 Alerta Vovó (tela)",function(v) st.alertaVovo=v end)
addB(tabFrames[1],119,"🔄 Rejoin",function()
 game:GetService("TeleportService"):Teleport(game.PlaceId,p)
end)

-- ═══════ ABA ESP ═══════
addEspCategory(tabFrames[2],3,"Vovó","espVovo","corVovo")
addEspCategory(tabFrames[2],90,"Neto","espNeto","corNeto")
addEspCategory(tabFrames[2],177,"Chaves","espChave","corChave")
addEspCategory(tabFrames[2],264,"Portas","espPorta","corPorta")
addEspCategory(tabFrames[2],351,"Objetos do Baú","espBau","corBau")

-- ═══════ ABA MIRA ═══════
addT(tabFrames[3],3,"🎯 Mira Vovó",function(v) st.miraVovo=v end)
addT(tabFrames[3],32,"🎯 Mira Neto",function(v) st.miraNeto=v end)
addT(tabFrames[3],61,"💪 Arremessar Vovó",function(v) st.arremessarVovo=v end)
addT(tabFrames[3],90,"💪 Arremessar Neto",function(v) st.arremessarNeto=v end)

local lblNome=Instance.new("TextLabel",tabFrames[3])
lblNome.Size=UDim2.new(1,-6,0,14)
lblNome.Position=UDim2.new(0,3,0,122)
lblNome.BackgroundTransparency=1
lblNome.Text="🎯 Mira por nome (digite):"
lblNome.TextColor3=CINZA
lblNome.Font=Enum.Font.GothamBold
lblNome.TextSize=9
lblNome.TextXAlignment=Enum.TextXAlignment.Left
lblNome.ZIndex=205

addInput(tabFrames[3],140,"Digite o nome do jogador",function(txt)
 st.miraNomeAlvo=txt
end)

local btnAplicarNome=Instance.new("TextButton",tabFrames[3])
btnAplicarNome.Size=UDim2.new(1,-6,0,24)
btnAplicarNome.Position=UDim2.new(0,3,0,168)
btnAplicarNome.BackgroundColor3=Color3.fromRGB(60,60,80)
btnAplicarNome.Text="🎯 Ativar mira neste nome"
btnAplicarNome.TextColor3=BRANCO
btnAplicarNome.Font=Enum.Font.GothamBold
btnAplicarNome.TextSize=9
btnAplicarNome.BorderSizePixel=0
btnAplicarNome.ZIndex=205
Instance.new("UICorner",btnAplicarNome).CornerRadius=UDim.new(0,4)
btnAplicarNome.MouseButton1Click:Connect(function()
 st.miraNome=not st.miraNome
 if st.miraNome then
  btnAplicarNome.BackgroundColor3=Color3.fromRGB(80,80,80)
  btnAplicarNome.Text="✅ Mirando: "..(st.miraNomeAlvo~="" and st.miraNomeAlvo or "?")
 else
  btnAplicarNome.BackgroundColor3=Color3.fromRGB(60,60,80)
  btnAplicarNome.Text="🎯 Ativar mira neste nome"
 end
end)

local lblJogadores=Instance.new("TextLabel",tabFrames[3])
lblJogadores.Size=UDim2.new(1,-6,0,14)
lblJogadores.Position=UDim2.new(0,3,0,200)
lblJogadores.BackgroundTransparency=1
lblJogadores.Text="📋 Jogadores no servidor:"
lblJogadores.TextColor3=CINZA
lblJogadores.Font=Enum.Font.GothamBold
lblJogadores.TextSize=9
lblJogadores.TextXAlignment=Enum.TextXAlignment.Left
lblJogadores.ZIndex=205

local listaJogadores=Instance.new("TextLabel",tabFrames[3])
listaJogadores.Size=UDim2.new(1,-6,0,140)
listaJogadores.Position=UDim2.new(0,3,0,218)
listaJogadores.BackgroundColor3=Color3.fromRGB(15,15,20)
listaJogadores.TextColor3=BRANCO
listaJogadores.Font=Enum.Font.Code
listaJogadores.TextSize=8
listaJogadores.TextXAlignment=Enum.TextXAlignment.Left
listaJogadores.TextYAlignment=Enum.TextYAlignment.Top
listaJogadores.TextWrapped=true
listaJogadores.BorderSizePixel=0
listaJogadores.ZIndex=205
Instance.new("UICorner",listaJogadores).CornerRadius=UDim.new(0,4)

task.spawn(function()
 while true do
  local txt=""
  local vovo=acharV()
  local lista={}
  for _,j in ipairs(P:GetPlayers()) do
   if j.Character then
    local s=sChar(j.Character)
    table.insert(lista,{plr=j,tam=s,char=j.Character})
   end
  end
  table.sort(lista,function(a,b) return a.tam<b.tam end)
  for _,info in ipairs(lista) do
   local j=info.plr
   local tipo
   if j==p then tipo="👤 VC"
   elseif info.char==vovo then tipo="👵 VOVÓ"
   else tipo="👶 NETO" end
   txt=txt..tipo.." "..j.Name.."\n"
  end
  if txt=="" then txt="Ninguém no servidor" end
  listaJogadores.Text=txt
  task.wait(1)
 end
end)

-- Abrir menu
ball.MouseButton1Click:Connect(function()
 menu.Visible=not menu.Visible
 if menu.Visible then
  menu.Position=UDim2.new(ball.Position.X.Scale,ball.Position.X.Offset+62,ball.Position.Y.Scale,ball.Position.Y.Offset-180)
 end
end)

-- Arrastar
local drag=false
local dStart=nil
local sPos=nil
ball.InputBegan:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  drag=true dStart=i.Position sPos=ball.Position
 end
end)
U.InputChanged:Connect(function(i)
 if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
  local d=i.Position-dStart
  ball.Position=UDim2.new(sPos.X.Scale,sPos.X.Offset+d.X,sPos.Y.Scale,sPos.Y.Offset+d.Y)
  if menu.Visible then
   menu.Position=UDim2.new(ball.Position.X.Scale,ball.Position.X.Offset+62,ball.Position.Y.Scale,ball.Position.Y.Offset-180)
  end
 end
end)
U.InputEnded:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then drag=false end
end)

print("⚫ [MJ 1.0] by "..CRIADOR.." carregado!")

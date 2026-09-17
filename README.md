-- 🚀 MJ 1.0 | by Mikael_N244BR
local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local p=P.LocalPlayer
local cam=workspace.CurrentCamera
local CRIADOR="Mikael_N244BR"

local st={noclip=false,infJump=false,vovo=false,mira=false,chave=false,fechadura=false,speed=16,cor=1}
local cores={
 {n="🟡 Amarelo",c=Color3.fromRGB(255,255,0)},
 {n="🟢 Verde",c=Color3.fromRGB(0,255,0)},
 {n="🔴 Vermelho",c=Color3.fromRGB(255,0,0)},
 {n="🔵 Azul",c=Color3.fromRGB(0,150,255)},
 {n="🟣 Roxo",c=Color3.fromRGB(180,0,255)},
 {n="🩷 Rosa",c=Color3.fromRGB(255,0,180)},
 {n="💠 Ciano",c=Color3.fromRGB(0,255,255)},
 {n="🟠 Laranja",c=Color3.fromRGB(255,130,0)},
 {n="🌈 Rainbow",c="rainbow"},
}
local function getCor()
 local c=cores[st.cor].c
 if c=="rainbow" then return Color3.fromHSV(tick()*0.4%1,1,1) end
 return c
end

local gui=Instance.new("ScreenGui",game.CoreGui)
gui.Name="MJ"
gui.ResetOnSpawn=false
gui.IgnoreGuiInset=true

-- ═══════ 🌌 FUNDO DE CONSTELAÇÕES ═══════
local constBg=Instance.new("Frame",gui)
constBg.Size=UDim2.new(1,0,1,0)
constBg.BackgroundTransparency=1
constBg.ZIndex=0

local constStars={}
for c=1,8 do
 local bx=math.random(5,85)/100
 local by=math.random(5,85)/100
 local n=math.random(4,7)
 local g={}
 for i=1,n do
  local s=Instance.new("Frame",constBg)
  s.Size=UDim2.new(0,math.random(1,3),0,math.random(1,3))
  s.Position=UDim2.new(bx+math.random(-8,8)/100,0,by+math.random(-8,8)/100,0)
  s.BackgroundColor3=Color3.fromRGB(220,220,255)
  s.BackgroundTransparency=math.random(20,60)/100
  s.BorderSizePixel=0
  s.ZIndex=1
  Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
  table.insert(g,s)
  table.insert(constStars,s)
 end
 for i=1,#g-1 do
  local a=g[i] local b=g[i+1]
  local ax,ay=a.Position.X.Scale*100,a.Position.Y.Scale*100
  local bx2,by2=b.Position.X.Scale*100,b.Position.Y.Scale*100
  local dx,dy=bx2-ax,by2-ay
  local dist=math.sqrt(dx*dx+dy*dy)
  local ang=math.deg(math.atan2(dy,dx))
  local line=Instance.new("Frame",constBg)
  line.Size=UDim2.new(0,dist*3.2,0,1)
  line.Position=UDim2.new(ax/100,0,ay/100,0)
  line.Rotation=ang
  line.BackgroundColor3=Color3.fromRGB(150,120,220)
  line.BackgroundTransparency=0.7
  line.BorderSizePixel=0
  line.ZIndex=0
  table.insert(constStars,line)
 end
end
for i=1,30 do
 local s=Instance.new("Frame",constBg)
 s.Size=UDim2.new(0,1,0,1)
 s.Position=UDim2.new(math.random(),0,math.random(),0)
 s.BackgroundColor3=Color3.fromRGB(200,200,255)
 s.BackgroundTransparency=math.random(50,85)/100
 s.BorderSizePixel=0
 s.ZIndex=0
 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
 table.insert(constStars,s)
end
task.spawn(function()
 while gui.Parent do
  for _,s in ipairs(constStars) do
   if s.Parent and s:IsA("Frame") and s.Size.X.Offset<=3 then
    s.BackgroundTransparency=math.random(20,85)/100
   end
  end
  task.wait(0.5)
 end
end)

-- ═══════ 🚀 FOGUETE ULTRA ANIMADO ═══════
local rocket=Instance.new("TextLabel",gui)
rocket.Size=UDim2.new(0,80,0,80)
rocket.Position=UDim2.new(0.5,-40,1,80)
rocket.BackgroundTransparency=1
rocket.Text="🚀"
rocket.TextScaled=true
rocket.Font=Enum.Font.GothamBold
rocket.ZIndex=15
rocket.Rotation=0

-- Fogo grande
local fogo=Instance.new("TextLabel",gui)
fogo.Size=UDim2.new(0,50,0,50)
fogo.BackgroundTransparency=1
fogo.Text="🔥"
fogo.TextScaled=true
fogo.ZIndex=14

-- Sparks (partículas brilhantes)
local sparks={}
for i=1,25 do
 local s=Instance.new("TextLabel",gui)
 s.Size=UDim2.new(0,16,0,16)
 s.BackgroundTransparency=1
 s.Text="✨"
 s.TextScaled=true
 s.Visible=false
 s.ZIndex=13
 table.insert(sparks,s)
end

-- Fumaça
local smokes={}
for i=1,20 do
 local s=Instance.new("Frame",gui)
 s.Size=UDim2.new(0,22,0,22)
 s.BackgroundColor3=Color3.fromRGB(230,230,255)
 s.BackgroundTransparency=0.4
 s.BorderSizePixel=0
 s.Visible=false
 s.ZIndex=12
 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
 table.insert(smokes,s)
end

-- Explosão final
local explosao=Instance.new("TextLabel",gui)
explosao.Size=UDim2.new(0,10,0,10)
explosao.BackgroundTransparency=1
explosao.Text="💥"
explosao.TextScaled=true
explosao.Visible=false
explosao.ZIndex=20

-- Texto MJ grande que aparece depois
local mjGrande=Instance.new("TextLabel",gui)
mjGrande.Size=UDim2.new(0,400,0,100)
mjGrande.Position=UDim2.new(0.5,-200,0.5,-50)
mjGrande.BackgroundTransparency=1
mjGrande.Text="MJ 1.0"
mjGrande.TextColor3=Color3.fromRGB(255,255,255)
mjGrande.TextStrokeColor3=Color3.fromRGB(150,80,255)
mjGrande.TextStrokeTransparency=0
mjGrande.Font=Enum.Font.GothamBold
mjGrande.TextSize=60
mjGrande.TextTransparency=1
mjGrande.ZIndex=20

task.spawn(function()
 -- Foguete sobe
 for t=0,1,0.006 do
  local yPos=1-t
  rocket.Position=UDim2.new(0.5,-40,yPos,0)
  rocket.Rotation=math.sin(t*15)*20
  
  fogo.Position=UDim2.new(0.5,-25,yPos,65)
  fogo.Size=UDim2.new(0,50+math.random(-8,8),0,50+math.random(-8,8))
  fogo.Rotation=math.random(-15,15)
  
  for i,s in ipairs(smokes) do
   s.Visible=true
   local off=0.04*i
   s.Position=UDim2.new(0.5+math.random(-50,50)/100,-11,yPos+off,0)
   s.BackgroundTransparency=0.2+(i/20)*0.7
   s.Size=UDim2.new(0,20-i/2,0,20-i/2)
  end
  
  for i,s in ipairs(sparks) do
   if not s.Visible then
    s.Visible=true
    s.Position=UDim2.new(0.5+math.random(-40,40)/100,-8,yPos+0.05+math.random(0,15)/100,0)
    s.TextTransparency=math.random(0,40)/100
   end
   s.Position=s.Position+UDim2.new(math.random(-3,3)/100,0,-2/100,0)
   s.TextTransparency=s.TextTransparency+0.02
  end
  
  task.wait(0.012)
 end
 
 -- Explosão no topo
 explosao.Position=UDim2.new(0.5,-100,-0.15,0)
 explosao.Size=UDim2.new(0,200,0,200)
 explosao.Visible=true
 for i=1,15 do
  explosao.Size=UDim2.new(0,200+i*30,0,200+i*30)
  explosao.Position=UDim2.new(0.5,-100-i*15,-0.15-i*15,0)
  explosao.TextTransparency=i/15
  task.wait(0.03)
 end
 explosao:Destroy()
 rocket:Destroy()
 fogo:Destroy()
 for _,s in ipairs(smokes) do s:Destroy() end
 for _,s in ipairs(sparks) do s:Destroy() end
 
 -- Aparece MJ grande piscando
 mjGrande.Text="🚀 MJ 1.0 🚀"
 for i=1,8 do
  mjGrande.TextTransparency=math.abs(math.sin(i/2))
  mjGrande.TextSize=60+i*3
  task.wait(0.08)
 end
 mjGrande.TextTransparency=0
 mjGrande.Text="✨ MJ 1.0 ✨"
 task.wait(1)
 for i=1,20 do
  mjGrande.TextTransparency=i/20
  task.wait(0.03)
 end
 mjGrande:Destroy()
end)

-- ═══════ 🎯 BOLINHA MJ ═══════
task.wait(3)
local ball=Instance.new("Frame",gui)
ball.Size=UDim2.new(0,0,0,0)
ball.Position=UDim2.new(0,20,0.5,-30)
ball.BackgroundColor3=Color3.fromRGB(5,3,15)
ball.BorderSizePixel=0
ball.Active=true
Instance.new("UICorner",ball).CornerRadius=UDim.new(1,0)
local bs=Instance.new("UIStroke",ball)
bs.Color=Color3.fromRGB(180,120,255)
bs.Thickness=2

local mjTxt=Instance.new("TextLabel",ball)
mjTxt.Size=UDim2.new(1,0,1,0)
mjTxt.BackgroundTransparency=1
mjTxt.Text="🌟MJ🌟"
mjTxt.TextColor3=Color3.fromRGB(255,255,255)
mjTxt.TextStrokeColor3=Color3.fromRGB(150,80,255)
mjTxt.TextStrokeTransparency=0.3
mjTxt.Font=Enum.Font.GothamBold
mjTxt.TextScaled=true
mjTxt.ZIndex=5

-- Animação de entrada
task.spawn(function()
 for i=1,15 do
  ball.Size=UDim2.new(0,55*i/15,0,55*i/15)
  ball.Position=UDim2.new(0,20,0.5,-30*i/15)
  task.wait(0.02)
 end
end)

-- ═══════ PAINEL ═══════
local panel=Instance.new("Frame",gui)
panel.Size=UDim2.new(0,300,0,400)
panel.Position=UDim2.new(0,85,0.5,-200)
panel.BackgroundColor3=Color3.fromRGB(5,3,15)
panel.BorderSizePixel=0
panel.Visible=false
Instance.new("UICorner",panel).CornerRadius=UDim.new(0,12)
local ps=Instance.new("UIStroke",panel)
ps.Color=Color3.fromRGB(150,100,255)
ps.Thickness=1.5

local pStars={}
for c=1,3 do
 local bx=math.random(10,70)/100
 local by=math.random(10,70)/100
 local g={}
 for i=1,5 do
  local s=Instance.new("Frame",panel)
  s.Size=UDim2.new(0,math.random(1,2),0,math.random(1,2))
  s.Position=UDim2.new(bx+math.random(-10,10)/100,0,by+math.random(-10,10)/100,0)
  s.BackgroundColor3=Color3.fromRGB(220,220,255)
  s.BackgroundTransparency=math.random(30,70)/100
  s.BorderSizePixel=0
  s.ZIndex=1
  Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
  table.insert(g,s)
  table.insert(pStars,s)
 end
 for i=1,#g-1 do
  local a=g[i] local b=g[i+1]
  local ax,ay=a.Position.X.Scale*100,a.Position.Y.Scale*100
  local bx2,by2=b.Position.X.Scale*100,b.Position.Y.Scale*100
  local dx,dy=bx2-ax,by2-ay
  local dist=math.sqrt(dx*dx+dy*dy)
  local ang=math.deg(math.atan2(dy,dx))
  local line=Instance.new("Frame",panel)
  line.Size=UDim2.new(0,dist*3,0,1)
  line.Position=UDim2.new(ax/100,0,ay/100,0)
  line.Rotation=ang
  line.BackgroundColor3=Color3.fromRGB(150,120,220)
  line.BackgroundTransparency=0.75
  line.BorderSizePixel=0
  line.ZIndex=1
  table.insert(pStars,line)
 end
end
task.spawn(function()
 while gui.Parent do
  for _,s in ipairs(pStars) do
   if s.Parent and s:IsA("Frame") and s.Size.X.Offset<=2 then
    s.BackgroundTransparency=math.random(30,80)/100
   end
  end
  task.wait(0.4)
 end
end)

local titulo=Instance.new("TextLabel",panel)
titulo.Size=UDim2.new(1,0,0,30)
titulo.BackgroundColor3=Color3.fromRGB(90,50,170)
titulo.BackgroundTransparency=0.2
titulo.Text="✨🚀 MJ 1.0 🚀✨"
titulo.TextColor3=Color3.fromRGB(255,255,255)
titulo.Font=Enum.Font.GothamBold
titulo.TextSize=14
titulo.BorderSizePixel=0
titulo.ZIndex=3
Instance.new("UICorner",titulo).CornerRadius=UDim.new(0,12)

local credito=Instance.new("TextLabel",panel)
credito.Size=UDim2.new(1,0,0,14)
credito.Position=UDim2.new(0,0,0,32)
credito.BackgroundTransparency=1
credito.Text="💜 by "..CRIADOR.." 💜"
credito.TextColor3=Color3.fromRGB(200,160,255)
credito.Font=Enum.Font.Gotham
credito.TextSize=10
credito.ZIndex=3

-- Avatar
task.spawn(function()
 local ok,userid=pcall(function() return P:GetUserIdFromNameAsync(CRIADOR) end)
 if ok and userid then
  local ok2,thumb=pcall(function()
   return P:GetUserThumbnailAsync(userid,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100)
  end)
  if ok2 and thumb then
   local av=Instance.new("ImageLabel",panel)
   av.Size=UDim2.new(0,32,0,32)
   av.Position=UDim2.new(1,-40,0,36)
   av.BackgroundColor3=Color3.fromRGB(30,15,60)
   av.BorderSizePixel=0
   av.Image=thumb
   av.ZIndex=4
   Instance.new("UICorner",av).CornerRadius=UDim.new(1,0)
  end
 end
end)

local fechar=Instance.new("TextButton",panel)
fechar.Size=UDim2.new(0,22,0,22)
fechar.Position=UDim2.new(1,-26,0,4)
fechar.BackgroundColor3=Color3.fromRGB(200,50,80)
fechar.Text="❌"
fechar.TextColor3=Color3.fromRGB(255,255,255)
fechar.Font=Enum.Font.GothamBold
fechar.TextSize=12
fechar.BorderSizePixel=0
fechar.ZIndex=4
Instance.new("UICorner",fechar).CornerRadius=UDim.new(1,0)
fechar.MouseButton1Click:Connect(function() panel.Visible=false end)

local tabBar=Instance.new("Frame",panel)
tabBar.Size=UDim2.new(1,-10,0,28)
tabBar.Position=UDim2.new(0,5,0,52)
tabBar.BackgroundTransparency=1
tabBar.ZIndex=3

local content=Instance.new("Frame",panel)
content.Size=UDim2.new(1,-10,1,-90)
content.Position=UDim2.new(0,5,0,85)
content.BackgroundTransparency=1
content.ZIndex=3

local tabNomes={"🏠 Principal","👵 Vovó","🔑 Chaves","⚙️ Extra"}
local tabBtns={}
local conteudos={}

for i,nome in ipairs(tabNomes) do
 local b=Instance.new("TextButton",tabBar)
 b.Size=UDim2.new(1/#tabNomes,-2,1,0)
 b.Position=UDim2.new((i-1)/#tabNomes,0,0,0)
 b.BackgroundColor3=Color3.fromRGB(40,25,80)
 b.Text=nome
 b.TextColor3=Color3.fromRGB(200,200,220)
 b.Font=Enum.Font.Gotham
 b.TextSize=9
 b.BorderSizePixel=0
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)
 table.insert(tabBtns,b)
 
 local c=Instance.new("ScrollingFrame",content)
 c.Size=UDim2.new(1,0,1,0)
 c.BackgroundTransparency=1
 c.BorderSizePixel=0
 c.ScrollBarThickness=3
 c.CanvasSize=UDim2.new(0,0,0,0)
 c.AutomaticCanvasSize=Enum.AutomaticSize.Y
 c.Visible=i==1
 table.insert(conteudos,c)
 
 b.MouseButton1Click:Connect(function()
  for j=1,#conteudos do
   conteudos[j].Visible=j==i
   tabBtns[j].BackgroundColor3=j==i and Color3.fromRGB(90,50,170) or Color3.fromRGB(40,25,80)
   tabBtns[j].TextColor3=j==i and Color3.fromRGB(255,255,255) or Color3.fromRGB(200,200,220)
  end
 end)
end
tabBtns[1].BackgroundColor3=Color3.fromRGB(90,50,170)
tabBtns[1].TextColor3=Color3.fromRGB(255,255,255)

local function addToggle(parent,y,txt,fn)
 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,26)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(40,25,80)
 b.Text=txt.." ⭕"
 b.TextColor3=Color3.fromRGB(255,255,255)
 b.Font=Enum.Font.Gotham
 b.TextSize=11
 b.BorderSizePixel=0
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,5)
 b.MouseButton1Click:Connect(function()
  local v=not b:GetAttribute("on")
  b:SetAttribute("on",v)
  b.Text=txt..(v and " ✅" or " ⭕")
  b.BackgroundColor3=v and Color3.fromRGB(0,150,50) or Color3.fromRGB(40,25,80)
  fn(v)
 end)
 return b
end

local function addButton(parent,y,txt,fn)
 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,26)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(60,40,110)
 b.Text=txt
 b.TextColor3=Color3.fromRGB(255,255,255)
 b.Font=Enum.Font.Gotham
 b.TextSize=11
 b.BorderSizePixel=0
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,5)
 b.MouseButton1Click:Connect(function() fn(b) end)
 return b
end

local drag,dStart,sPos=false,nil,nil
local clickStart=0
ball.InputBegan:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  drag=true dStart=i.Position sPos=ball.Position clickStart=tick()
 end
end)
ball.InputEnded:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  drag=false
  if tick()-clickStart<0.25 then
   panel.Visible=not panel.Visible
   panel.Position=UDim2.new(ball.Position.X.Scale,ball.Position.X.Offset+65,ball.Position.Y.Scale,ball.Position.Y.Offset-10)
  end
 end
end)
U.InputChanged:Connect(function(i)
 if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
  local d=i.Position-dStart
  ball.Position=UDim2.new(sPos.X.Scale,sPos.X.Offset+d.X,sPos.Y.Scale,sPos.Y.Offset+d.Y)
  panel.Position=UDim2.new(ball.Position.X.Scale,ball.Position.X.Offset+65,ball.Position.Y.Scale,ball.Position.Y.Offset-10)
 end
end)

local function sizeChar(m)
 if not m then return 0 end
 local h=m:FindFirstChild("HumanoidRootPart")
 if not h then return 0 end
 return math.max(h.Size.X,h.Size.Y,h.Size.Z)
end
local function outros()
 local t={}
 for _,j in ipairs(P:GetPlayers()) do
  if j~=p and j.Character then
   local h=j.Character:FindFirstChildOfClass("Humanoid")
   if h and h.Health>0 then
    table.insert(t,{p=j,c=j.Character,s=sizeChar(j.Character),h=h})
   end
  end
 end
 return t
end
local vovoRef=nil
local function acharVovo()
 if vovoRef and vovoRef.Parent then
  local h=vovoRef:FindFirstChildOfClass("Humanoid")
  if h and h.Health>0 then return vovoRef end
 end
 local o=outros()
 if #o==0 then return nil end
 table.sort(o,function(a,b) return a.s>b.s end)
 vovoRef=o[1].c
 return o[1].c
end

local hls={}
local function limpar()
 for _,h in ipairs(hls) do if h.Parent then h:Destroy() end end
 hls={}
end
local function addHL(part,txt)
 if not part or not part.Parent or part:FindFirstChild("MJHL") then return end
 local c=getCor()
 local hl=Instance.new("Highlight",part)
 hl.Name="MJHL"
 hl.FillColor=c
 hl.OutlineColor=c
 hl.FillTransparency=0.75
 hl.OutlineTransparency=0
 hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
 table.insert(hls,hl)
 if txt then
  local b=Instance.new("BillboardGui",part)
  b.Size=UDim2.new(0,80,0,12)
  b.StudsOffset=Vector3.new(0,2,0)
  b.AlwaysOnTop=true
  local t=Instance.new("TextLabel",b)
  t.Size=UDim2.new(1,0,1,0)
  t.BackgroundTransparency=1
  t.Text=txt
  t.TextColor3=c
  t.TextStrokeTransparency=0
  t.TextScaled=true
  t.Font=Enum.Font.GothamBold
 end
end

local gHL,gBB
local function espVovo(c)
 if not c or not c.Parent then return end
 local cor=getCor()
 if gHL and gHL.Parent then
  gHL.Adornee=c
  gHL.FillColor=cor
  gHL.OutlineColor=cor
 else
  gHL=Instance.new("Highlight",c)
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
   local t=gBB:FindFirstChildWhichIsA("TextLabel")
   if t then t.TextColor3=cor end
  else
   gBB=Instance.new("BillboardGui",h)
   gBB.Size=UDim2.new(0,80,0,12)
   gBB.StudsOffset=Vector3.new(0,3,0)
   gBB.AlwaysOnTop=true
   local t=Instance.new("TextLabel",gBB)
   t.Size=UDim2.new(1,0,1,0)
   t.BackgroundTransparency=1
   local pl=P:GetPlayerFromCharacter(c)
   t.Text="👵 "..(pl and pl.Name or c.Name)
   t.TextColor3=cor
   t.TextStrokeTransparency=0
   t.TextScaled=true
   t.Font=Enum.Font.GothamBold
  end
 end
end
local function remVovo()
 if gHL and gHL.Parent then gHL:Destroy() end
 if gBB and gBB.Parent then gBB:Destroy() end
 gHL,gBB=nil,nil
end

R.Stepped:Connect(function()
 if st.noclip then
  local c=p.Character
  if c then for _,x in ipairs(c:GetDescendants()) do
   if x:IsA("BasePart") then x.CanCollide=false end
  end end
 end
end)
U.JumpRequest:Connect(function()
 if st.infJump then
  local c=p.Character
  if c then local h=c:FindFirstChildOfClass("Humanoid")
   if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
  end
 end
end)
R:BindToRenderStep("MJA",201,function()
 if st.mira then
  local v=acharVovo()
  if v then
   local h=v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Head")
   if h then cam.CFrame=CFrame.lookAt(cam.CFrame.Position,h.Position) end
  end
 end
end)
task.spawn(function()
 while true do
  local cor=getCor()
  if st.vovo then
   local v=acharVovo()
   if v then espVovo(v) end
  end
  if st.chave then
   for _,o in ipairs(workspace:GetDescendants()) do
    if o:IsA("BasePart") and (o.Name:lower():find("key") or o.Name:lower():find("chave")) then addHL(o,"🔑") end
   end
  end
  if st.fechadura then
   for _,o in ipairs(workspace:GetDescendants()) do
    if o:IsA("BasePart") and (o.Name:lower():find("lock") or o.Name:lower():find("porta") or o.Name:lower():find("door")) then addHL(o,"🚪") end
   end
  end
  if cores[st.cor].c=="rainbow" then
   for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="MJHL" then o.FillColor=cor o.OutlineColor=cor end
   end
   if gHL and gHL.Parent then gHL.FillColor=cor gHL.OutlineColor=cor end
  end
  task.wait(0.5)
 end
end)

local c1=conteudos[1]
addToggle(c1,5,"🚶 Noclip",function(v)
 st.noclip=v
 if not v then local c=p.Character
  if c then for _,x in ipairs(c:GetDescendants()) do
   if x:IsA("BasePart") then x.CanCollide=true end
  end end
 end
end)
addButton(c1,35,"⚡ Speed: 16",function(b)
 st.speed=st.speed+16
 if st.speed>200 then st.speed=16 end
 b.Text="⚡ Speed: "..st.speed
 local c=p.Character
 if c then local h=c:FindFirstChildOfClass("Humanoid")
  if h then h.WalkSpeed=st.speed end
 end
end)
addToggle(c1,65,"🦘 Infinite Jump",function(v) st.infJump=v end)

local c2=conteudos[2]
addButton(c2,5,"🎨 Cor: 🟡 Amarelo",function(b)
 st.cor=st.cor+1
 if st.cor>#cores then st.cor=1 end
 b.Text="🎨 Cor: "..cores[st.cor].n
end)
addToggle(c2,35,"👵 ESP Vovó",function(v) st.vovo=v if not v then remVovo() end end)
addToggle(c2,65,"🎯 Mira Vovó",function(v) st.mira=v end)
addButton(c2,95,"📋 Listar Jogadores (F9)",function()
 local o=outros()
 table.sort(o,function(a,b) return a.s>b.s end)
 print("═══════ 🎮 JOGADORES ═══════")
 for i,j in ipairs(o) do print("["..i.."] 👤 "..j.p.Name.." | 📏 "..string.format("%.2f",j.s)) end
end)

local c3=conteudos[3]
addToggle(c3,5,"🔑 ESP Chaves",function(v) st.chave=v end)
addToggle(c3,35,"🚪 ESP Fechaduras",function(v) st.fechadura=v end)
addButton(c3,65,"🧹 Limpar Destaques",function() limpar() end)

local c4=conteudos[4]
addButton(c4,5,"🔄 Rejoin Server",function()
 game:GetService("TeleportService"):Teleport(game.PlaceId,p)
end)

print("🚀 [MJ 1.0] by "..CRIADOR.." carregado! ✨")-- 🚀 MJ 1.0 | by Mikael_N244BR
local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local p=P.LocalPlayer
local cam=workspace.CurrentCamera
local CRIADOR="Mikael_N244BR"

local st={noclip=false,infJump=false,vovo=false,mira=false,chave=false,fechadura=false,speed=16,cor=1}
local cores={
 {n="🟡 Amarelo",c=Color3.fromRGB(255,255,0)},
 {n="🟢 Verde",c=Color3.fromRGB(0,255,0)},
 {n="🔴 Vermelho",c=Color3.fromRGB(255,0,0)},
 {n="🔵 Azul",c=Color3.fromRGB(0,150,255)},
 {n="🟣 Roxo",c=Color3.fromRGB(180,0,255)},
 {n="🩷 Rosa",c=Color3.fromRGB(255,0,180)},
 {n="💠 Ciano",c=Color3.fromRGB(0,255,255)},
 {n="🟠 Laranja",c=Color3.fromRGB(255,130,0)},
 {n="🌈 Rainbow",c="rainbow"},
}
local function getCor()
 local c=cores[st.cor].c
 if c=="rainbow" then return Color3.fromHSV(tick()*0.4%1,1,1) end
 return c
end

local gui=Instance.new("ScreenGui",game.CoreGui)
gui.Name="MJ"
gui.ResetOnSpawn=false
gui.IgnoreGuiInset=true

-- ═══════ 🌌 FUNDO DE CONSTELAÇÕES ═══════
local constBg=Instance.new("Frame",gui)
constBg.Size=UDim2.new(1,0,1,0)
constBg.BackgroundTransparency=1
constBg.ZIndex=0

local constStars={}
for c=1,8 do
 local bx=math.random(5,85)/100
 local by=math.random(5,85)/100
 local n=math.random(4,7)
 local g={}
 for i=1,n do
  local s=Instance.new("Frame",constBg)
  s.Size=UDim2.new(0,math.random(1,3),0,math.random(1,3))
  s.Position=UDim2.new(bx+math.random(-8,8)/100,0,by+math.random(-8,8)/100,0)
  s.BackgroundColor3=Color3.fromRGB(220,220,255)
  s.BackgroundTransparency=math.random(20,60)/100
  s.BorderSizePixel=0
  s.ZIndex=1
  Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
  table.insert(g,s)
  table.insert(constStars,s)
 end
 for i=1,#g-1 do
  local a=g[i] local b=g[i+1]
  local ax,ay=a.Position.X.Scale*100,a.Position.Y.Scale*100
  local bx2,by2=b.Position.X.Scale*100,b.Position.Y.Scale*100
  local dx,dy=bx2-ax,by2-ay
  local dist=math.sqrt(dx*dx+dy*dy)
  local ang=math.deg(math.atan2(dy,dx))
  local line=Instance.new("Frame",constBg)
  line.Size=UDim2.new(0,dist*3.2,0,1)
  line.Position=UDim2.new(ax/100,0,ay/100,0)
  line.Rotation=ang
  line.BackgroundColor3=Color3.fromRGB(150,120,220)
  line.BackgroundTransparency=0.7
  line.BorderSizePixel=0
  line.ZIndex=0
  table.insert(constStars,line)
 end
end
for i=1,30 do
 local s=Instance.new("Frame",constBg)
 s.Size=UDim2.new(0,1,0,1)
 s.Position=UDim2.new(math.random(),0,math.random(),0)
 s.BackgroundColor3=Color3.fromRGB(200,200,255)
 s.BackgroundTransparency=math.random(50,85)/100
 s.BorderSizePixel=0
 s.ZIndex=0
 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
 table.insert(constStars,s)
end
task.spawn(function()
 while gui.Parent do
  for _,s in ipairs(constStars) do
   if s.Parent and s:IsA("Frame") and s.Size.X.Offset<=3 then
    s.BackgroundTransparency=math.random(20,85)/100
   end
  end
  task.wait(0.5)
 end
end)

-- ═══════ 🚀 FOGUETE ULTRA ANIMADO ═══════
local rocket=Instance.new("TextLabel",gui)
rocket.Size=UDim2.new(0,80,0,80)
rocket.Position=UDim2.new(0.5,-40,1,80)
rocket.BackgroundTransparency=1
rocket.Text="🚀"
rocket.TextScaled=true
rocket.Font=Enum.Font.GothamBold
rocket.ZIndex=15
rocket.Rotation=0

-- Fogo grande
local fogo=Instance.new("TextLabel",gui)
fogo.Size=UDim2.new(0,50,0,50)
fogo.BackgroundTransparency=1
fogo.Text="🔥"
fogo.TextScaled=true
fogo.ZIndex=14

-- Sparks (partículas brilhantes)
local sparks={}
for i=1,25 do
 local s=Instance.new("TextLabel",gui)
 s.Size=UDim2.new(0,16,0,16)
 s.BackgroundTransparency=1
 s.Text="✨"
 s.TextScaled=true
 s.Visible=false
 s.ZIndex=13
 table.insert(sparks,s)
end

-- Fumaça
local smokes={}
for i=1,20 do
 local s=Instance.new("Frame",gui)
 s.Size=UDim2.new(0,22,0,22)
 s.BackgroundColor3=Color3.fromRGB(230,230,255)
 s.BackgroundTransparency=0.4
 s.BorderSizePixel=0
 s.Visible=false
 s.ZIndex=12
 Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
 table.insert(smokes,s)
end

-- Explosão final
local explosao=Instance.new("TextLabel",gui)
explosao.Size=UDim2.new(0,10,0,10)
explosao.BackgroundTransparency=1
explosao.Text="💥"
explosao.TextScaled=true
explosao.Visible=false
explosao.ZIndex=20

-- Texto MJ grande que aparece depois
local mjGrande=Instance.new("TextLabel",gui)
mjGrande.Size=UDim2.new(0,400,0,100)
mjGrande.Position=UDim2.new(0.5,-200,0.5,-50)
mjGrande.BackgroundTransparency=1
mjGrande.Text="MJ 1.0"
mjGrande.TextColor3=Color3.fromRGB(255,255,255)
mjGrande.TextStrokeColor3=Color3.fromRGB(150,80,255)
mjGrande.TextStrokeTransparency=0
mjGrande.Font=Enum.Font.GothamBold
mjGrande.TextSize=60
mjGrande.TextTransparency=1
mjGrande.ZIndex=20

task.spawn(function()
 -- Foguete sobe
 for t=0,1,0.006 do
  local yPos=1-t
  rocket.Position=UDim2.new(0.5,-40,yPos,0)
  rocket.Rotation=math.sin(t*15)*20
  
  fogo.Position=UDim2.new(0.5,-25,yPos,65)
  fogo.Size=UDim2.new(0,50+math.random(-8,8),0,50+math.random(-8,8))
  fogo.Rotation=math.random(-15,15)
  
  for i,s in ipairs(smokes) do
   s.Visible=true
   local off=0.04*i
   s.Position=UDim2.new(0.5+math.random(-50,50)/100,-11,yPos+off,0)
   s.BackgroundTransparency=0.2+(i/20)*0.7
   s.Size=UDim2.new(0,20-i/2,0,20-i/2)
  end
  
  for i,s in ipairs(sparks) do
   if not s.Visible then
    s.Visible=true
    s.Position=UDim2.new(0.5+math.random(-40,40)/100,-8,yPos+0.05+math.random(0,15)/100,0)
    s.TextTransparency=math.random(0,40)/100
   end
   s.Position=s.Position+UDim2.new(math.random(-3,3)/100,0,-2/100,0)
   s.TextTransparency=s.TextTransparency+0.02
  end
  
  task.wait(0.012)
 end
 
 -- Explosão no topo
 explosao.Position=UDim2.new(0.5,-100,-0.15,0)
 explosao.Size=UDim2.new(0,200,0,200)
 explosao.Visible=true
 for i=1,15 do
  explosao.Size=UDim2.new(0,200+i*30,0,200+i*30)
  explosao.Position=UDim2.new(0.5,-100-i*15,-0.15-i*15,0)
  explosao.TextTransparency=i/15
  task.wait(0.03)
 end
 explosao:Destroy()
 rocket:Destroy()
 fogo:Destroy()
 for _,s in ipairs(smokes) do s:Destroy() end
 for _,s in ipairs(sparks) do s:Destroy() end
 
 -- Aparece MJ grande piscando
 mjGrande.Text="🚀 MJ 1.0 🚀"
 for i=1,8 do
  mjGrande.TextTransparency=math.abs(math.sin(i/2))
  mjGrande.TextSize=60+i*3
  task.wait(0.08)
 end
 mjGrande.TextTransparency=0
 mjGrande.Text="✨ MJ 1.0 ✨"
 task.wait(1)
 for i=1,20 do
  mjGrande.TextTransparency=i/20
  task.wait(0.03)
 end
 mjGrande:Destroy()
end)

-- ═══════ 🎯 BOLINHA MJ ═══════
task.wait(3)
local ball=Instance.new("Frame",gui)
ball.Size=UDim2.new(0,0,0,0)
ball.Position=UDim2.new(0,20,0.5,-30)
ball.BackgroundColor3=Color3.fromRGB(5,3,15)
ball.BorderSizePixel=0
ball.Active=true
Instance.new("UICorner",ball).CornerRadius=UDim.new(1,0)
local bs=Instance.new("UIStroke",ball)
bs.Color=Color3.fromRGB(180,120,255)
bs.Thickness=2

local mjTxt=Instance.new("TextLabel",ball)
mjTxt.Size=UDim2.new(1,0,1,0)
mjTxt.BackgroundTransparency=1
mjTxt.Text="🌟MJ🌟"
mjTxt.TextColor3=Color3.fromRGB(255,255,255)
mjTxt.TextStrokeColor3=Color3.fromRGB(150,80,255)
mjTxt.TextStrokeTransparency=0.3
mjTxt.Font=Enum.Font.GothamBold
mjTxt.TextScaled=true
mjTxt.ZIndex=5

-- Animação de entrada
task.spawn(function()
 for i=1,15 do
  ball.Size=UDim2.new(0,55*i/15,0,55*i/15)
  ball.Position=UDim2.new(0,20,0.5,-30*i/15)
  task.wait(0.02)
 end
end)

-- ═══════ PAINEL ═══════
local panel=Instance.new("Frame",gui)
panel.Size=UDim2.new(0,300,0,400)
panel.Position=UDim2.new(0,85,0.5,-200)
panel.BackgroundColor3=Color3.fromRGB(5,3,15)
panel.BorderSizePixel=0
panel.Visible=false
Instance.new("UICorner",panel).CornerRadius=UDim.new(0,12)
local ps=Instance.new("UIStroke",panel)
ps.Color=Color3.fromRGB(150,100,255)
ps.Thickness=1.5

local pStars={}
for c=1,3 do
 local bx=math.random(10,70)/100
 local by=math.random(10,70)/100
 local g={}
 for i=1,5 do
  local s=Instance.new("Frame",panel)
  s.Size=UDim2.new(0,math.random(1,2),0,math.random(1,2))
  s.Position=UDim2.new(bx+math.random(-10,10)/100,0,by+math.random(-10,10)/100,0)
  s.BackgroundColor3=Color3.fromRGB(220,220,255)
  s.BackgroundTransparency=math.random(30,70)/100
  s.BorderSizePixel=0
  s.ZIndex=1
  Instance.new("UICorner",s).CornerRadius=UDim.new(1,0)
  table.insert(g,s)
  table.insert(pStars,s)
 end
 for i=1,#g-1 do
  local a=g[i] local b=g[i+1]
  local ax,ay=a.Position.X.Scale*100,a.Position.Y.Scale*100
  local bx2,by2=b.Position.X.Scale*100,b.Position.Y.Scale*100
  local dx,dy=bx2-ax,by2-ay
  local dist=math.sqrt(dx*dx+dy*dy)
  local ang=math.deg(math.atan2(dy,dx))
  local line=Instance.new("Frame",panel)
  line.Size=UDim2.new(0,dist*3,0,1)
  line.Position=UDim2.new(ax/100,0,ay/100,0)
  line.Rotation=ang
  line.BackgroundColor3=Color3.fromRGB(150,120,220)
  line.BackgroundTransparency=0.75
  line.BorderSizePixel=0
  line.ZIndex=1
  table.insert(pStars,line)
 end
end
task.spawn(function()
 while gui.Parent do
  for _,s in ipairs(pStars) do
   if s.Parent and s:IsA("Frame") and s.Size.X.Offset<=2 then
    s.BackgroundTransparency=math.random(30,80)/100
   end
  end
  task.wait(0.4)
 end
end)

local titulo=Instance.new("TextLabel",panel)
titulo.Size=UDim2.new(1,0,0,30)
titulo.BackgroundColor3=Color3.fromRGB(90,50,170)
titulo.BackgroundTransparency=0.2
titulo.Text="✨🚀 MJ 1.0 🚀✨"
titulo.TextColor3=Color3.fromRGB(255,255,255)
titulo.Font=Enum.Font.GothamBold
titulo.TextSize=14
titulo.BorderSizePixel=0
titulo.ZIndex=3
Instance.new("UICorner",titulo).CornerRadius=UDim.new(0,12)

local credito=Instance.new("TextLabel",panel)
credito.Size=UDim2.new(1,0,0,14)
credito.Position=UDim2.new(0,0,0,32)
credito.BackgroundTransparency=1
credito.Text="💜 by "..CRIADOR.." 💜"
credito.TextColor3=Color3.fromRGB(200,160,255)
credito.Font=Enum.Font.Gotham
credito.TextSize=10
credito.ZIndex=3

-- Avatar
task.spawn(function()
 local ok,userid=pcall(function() return P:GetUserIdFromNameAsync(CRIADOR) end)
 if ok and userid then
  local ok2,thumb=pcall(function()
   return P:GetUserThumbnailAsync(userid,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100)
  end)
  if ok2 and thumb then
   local av=Instance.new("ImageLabel",panel)
   av.Size=UDim2.new(0,32,0,32)
   av.Position=UDim2.new(1,-40,0,36)
   av.BackgroundColor3=Color3.fromRGB(30,15,60)
   av.BorderSizePixel=0
   av.Image=thumb
   av.ZIndex=4
   Instance.new("UICorner",av).CornerRadius=UDim.new(1,0)
  end
 end
end)

local fechar=Instance.new("TextButton",panel)
fechar.Size=UDim2.new(0,22,0,22)
fechar.Position=UDim2.new(1,-26,0,4)
fechar.BackgroundColor3=Color3.fromRGB(200,50,80)
fechar.Text="❌"
fechar.TextColor3=Color3.fromRGB(255,255,255)
fechar.Font=Enum.Font.GothamBold
fechar.TextSize=12
fechar.BorderSizePixel=0
fechar.ZIndex=4
Instance.new("UICorner",fechar).CornerRadius=UDim.new(1,0)
fechar.MouseButton1Click:Connect(function() panel.Visible=false end)

local tabBar=Instance.new("Frame",panel)
tabBar.Size=UDim2.new(1,-10,0,28)
tabBar.Position=UDim2.new(0,5,0,52)
tabBar.BackgroundTransparency=1
tabBar.ZIndex=3

local content=Instance.new("Frame",panel)
content.Size=UDim2.new(1,-10,1,-90)
content.Position=UDim2.new(0,5,0,85)
content.BackgroundTransparency=1
content.ZIndex=3

local tabNomes={"🏠 Principal","👵 Vovó","🔑 Chaves","⚙️ Extra"}
local tabBtns={}
local conteudos={}

for i,nome in ipairs(tabNomes) do
 local b=Instance.new("TextButton",tabBar)
 b.Size=UDim2.new(1/#tabNomes,-2,1,0)
 b.Position=UDim2.new((i-1)/#tabNomes,0,0,0)
 b.BackgroundColor3=Color3.fromRGB(40,25,80)
 b.Text=nome
 b.TextColor3=Color3.fromRGB(200,200,220)
 b.Font=Enum.Font.Gotham
 b.TextSize=9
 b.BorderSizePixel=0
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)
 table.insert(tabBtns,b)
 
 local c=Instance.new("ScrollingFrame",content)
 c.Size=UDim2.new(1,0,1,0)
 c.BackgroundTransparency=1
 c.BorderSizePixel=0
 c.ScrollBarThickness=3
 c.CanvasSize=UDim2.new(0,0,0,0)
 c.AutomaticCanvasSize=Enum.AutomaticSize.Y
 c.Visible=i==1
 table.insert(conteudos,c)
 
 b.MouseButton1Click:Connect(function()
  for j=1,#conteudos do
   conteudos[j].Visible=j==i
   tabBtns[j].BackgroundColor3=j==i and Color3.fromRGB(90,50,170) or Color3.fromRGB(40,25,80)
   tabBtns[j].TextColor3=j==i and Color3.fromRGB(255,255,255) or Color3.fromRGB(200,200,220)
  end
 end)
end
tabBtns[1].BackgroundColor3=Color3.fromRGB(90,50,170)
tabBtns[1].TextColor3=Color3.fromRGB(255,255,255)

local function addToggle(parent,y,txt,fn)
 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,26)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(40,25,80)
 b.Text=txt.." ⭕"
 b.TextColor3=Color3.fromRGB(255,255,255)
 b.Font=Enum.Font.Gotham
 b.TextSize=11
 b.BorderSizePixel=0
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,5)
 b.MouseButton1Click:Connect(function()
  local v=not b:GetAttribute("on")
  b:SetAttribute("on",v)
  b.Text=txt..(v and " ✅" or " ⭕")
  b.BackgroundColor3=v and Color3.fromRGB(0,150,50) or Color3.fromRGB(40,25,80)
  fn(v)
 end)
 return b
end

local function addButton(parent,y,txt,fn)
 local b=Instance.new("TextButton",parent)
 b.Size=UDim2.new(1,-8,0,26)
 b.Position=UDim2.new(0,4,0,y)
 b.BackgroundColor3=Color3.fromRGB(60,40,110)
 b.Text=txt
 b.TextColor3=Color3.fromRGB(255,255,255)
 b.Font=Enum.Font.Gotham
 b.TextSize=11
 b.BorderSizePixel=0
 Instance.new("UICorner",b).CornerRadius=UDim.new(0,5)
 b.MouseButton1Click:Connect(function() fn(b) end)
 return b
end

local drag,dStart,sPos=false,nil,nil
local clickStart=0
ball.InputBegan:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  drag=true dStart=i.Position sPos=ball.Position clickStart=tick()
 end
end)
ball.InputEnded:Connect(function(i)
 if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then
  drag=false
  if tick()-clickStart<0.25 then
   panel.Visible=not panel.Visible
   panel.Position=UDim2.new(ball.Position.X.Scale,ball.Position.X.Offset+65,ball.Position.Y.Scale,ball.Position.Y.Offset-10)
  end
 end
end)
U.InputChanged:Connect(function(i)
 if drag and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then
  local d=i.Position-dStart
  ball.Position=UDim2.new(sPos.X.Scale,sPos.X.Offset+d.X,sPos.Y.Scale,sPos.Y.Offset+d.Y)
  panel.Position=UDim2.new(ball.Position.X.Scale,ball.Position.X.Offset+65,ball.Position.Y.Scale,ball.Position.Y.Offset-10)
 end
end)

local function sizeChar(m)
 if not m then return 0 end
 local h=m:FindFirstChild("HumanoidRootPart")
 if not h then return 0 end
 return math.max(h.Size.X,h.Size.Y,h.Size.Z)
end
local function outros()
 local t={}
 for _,j in ipairs(P:GetPlayers()) do
  if j~=p and j.Character then
   local h=j.Character:FindFirstChildOfClass("Humanoid")
   if h and h.Health>0 then
    table.insert(t,{p=j,c=j.Character,s=sizeChar(j.Character),h=h})
   end
  end
 end
 return t
end
local vovoRef=nil
local function acharVovo()
 if vovoRef and vovoRef.Parent then
  local h=vovoRef:FindFirstChildOfClass("Humanoid")
  if h and h.Health>0 then return vovoRef end
 end
 local o=outros()
 if #o==0 then return nil end
 table.sort(o,function(a,b) return a.s>b.s end)
 vovoRef=o[1].c
 return o[1].c
end

local hls={}
local function limpar()
 for _,h in ipairs(hls) do if h.Parent then h:Destroy() end end
 hls={}
end
local function addHL(part,txt)
 if not part or not part.Parent or part:FindFirstChild("MJHL") then return end
 local c=getCor()
 local hl=Instance.new("Highlight",part)
 hl.Name="MJHL"
 hl.FillColor=c
 hl.OutlineColor=c
 hl.FillTransparency=0.75
 hl.OutlineTransparency=0
 hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
 table.insert(hls,hl)
 if txt then
  local b=Instance.new("BillboardGui",part)
  b.Size=UDim2.new(0,80,0,12)
  b.StudsOffset=Vector3.new(0,2,0)
  b.AlwaysOnTop=true
  local t=Instance.new("TextLabel",b)
  t.Size=UDim2.new(1,0,1,0)
  t.BackgroundTransparency=1
  t.Text=txt
  t.TextColor3=c
  t.TextStrokeTransparency=0
  t.TextScaled=true
  t.Font=Enum.Font.GothamBold
 end
end

local gHL,gBB
local function espVovo(c)
 if not c or not c.Parent then return end
 local cor=getCor()
 if gHL and gHL.Parent then
  gHL.Adornee=c
  gHL.FillColor=cor
  gHL.OutlineColor=cor
 else
  gHL=Instance.new("Highlight",c)
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
   local t=gBB:FindFirstChildWhichIsA("TextLabel")
   if t then t.TextColor3=cor end
  else
   gBB=Instance.new("BillboardGui",h)
   gBB.Size=UDim2.new(0,80,0,12)
   gBB.StudsOffset=Vector3.new(0,3,0)
   gBB.AlwaysOnTop=true
   local t=Instance.new("TextLabel",gBB)
   t.Size=UDim2.new(1,0,1,0)
   t.BackgroundTransparency=1
   local pl=P:GetPlayerFromCharacter(c)
   t.Text="👵 "..(pl and pl.Name or c.Name)
   t.TextColor3=cor
   t.TextStrokeTransparency=0
   t.TextScaled=true
   t.Font=Enum.Font.GothamBold
  end
 end
end
local function remVovo()
 if gHL and gHL.Parent then gHL:Destroy() end
 if gBB and gBB.Parent then gBB:Destroy() end
 gHL,gBB=nil,nil
end

R.Stepped:Connect(function()
 if st.noclip then
  local c=p.Character
  if c then for _,x in ipairs(c:GetDescendants()) do
   if x:IsA("BasePart") then x.CanCollide=false end
  end end
 end
end)
U.JumpRequest:Connect(function()
 if st.infJump then
  local c=p.Character
  if c then local h=c:FindFirstChildOfClass("Humanoid")
   if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
  end
 end
end)
R:BindToRenderStep("MJA",201,function()
 if st.mira then
  local v=acharVovo()
  if v then
   local h=v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Head")
   if h then cam.CFrame=CFrame.lookAt(cam.CFrame.Position,h.Position) end
  end
 end
end)
task.spawn(function()
 while true do
  local cor=getCor()
  if st.vovo then
   local v=acharVovo()
   if v then espVovo(v) end
  end
  if st.chave then
   for _,o in ipairs(workspace:GetDescendants()) do
    if o:IsA("BasePart") and (o.Name:lower():find("key") or o.Name:lower():find("chave")) then addHL(o,"🔑") end
   end
  end
  if st.fechadura then
   for _,o in ipairs(workspace:GetDescendants()) do
    if o:IsA("BasePart") and (o.Name:lower():find("lock") or o.Name:lower():find("porta") or o.Name:lower():find("door")) then addHL(o,"🚪") end
   end
  end
  if cores[st.cor].c=="rainbow" then
   for _,o in ipairs(workspace:GetDescendants()) do
    if o.Name=="MJHL" then o.FillColor=cor o.OutlineColor=cor end
   end
   if gHL and gHL.Parent then gHL.FillColor=cor gHL.OutlineColor=cor end
  end
  task.wait(0.5)
 end
end)

local c1=conteudos[1]
addToggle(c1,5,"🚶 Noclip",function(v)
 st.noclip=v
 if not v then local c=p.Character
  if c then for _,x in ipairs(c:GetDescendants()) do
   if x:IsA("BasePart") then x.CanCollide=true end
  end end
 end
end)
addButton(c1,35,"⚡ Speed: 16",function(b)
 st.speed=st.speed+16
 if st.speed>200 then st.speed=16 end
 b.Text="⚡ Speed: "..st.speed
 local c=p.Character
 if c then local h=c:FindFirstChildOfClass("Humanoid")
  if h then h.WalkSpeed=st.speed end
 end
end)
addToggle(c1,65,"🦘 Infinite Jump",function(v) st.infJump=v end)

local c2=conteudos[2]
addButton(c2,5,"🎨 Cor: 🟡 Amarelo",function(b)
 st.cor=st.cor+1
 if st.cor>#cores then st.cor=1 end
 b.Text="🎨 Cor: "..cores[st.cor].n
end)
addToggle(c2,35,"👵 ESP Vovó",function(v) st.vovo=v if not v then remVovo() end end)
addToggle(c2,65,"🎯 Mira Vovó",function(v) st.mira=v end)
addButton(c2,95,"📋 Listar Jogadores (F9)",function()
 local o=outros()
 table.sort(o,function(a,b) return a.s>b.s end)
 print("═══════ 🎮 JOGADORES ═══════")
 for i,j in ipairs(o) do print("["..i.."] 👤 "..j.p.Name.." | 📏 "..string.format("%.2f",j.s)) end
end)

local c3=conteudos[3]
addToggle(c3,5,"🔑 ESP Chaves",function(v) st.chave=v end)
addToggle(c3,35,"🚪 ESP Fechaduras",function(v) st.fechad
addButton(c3,65,"🧹 Limpar Destaques",function() limpar() end)

local c4=conteudos[4]
addButton(c4,5,"🔄 Rejoin Server",function()
 game:GetService("TeleportService"):Teleport(game.PlaceId,p)
end)

print("🚀 [MJ 1.0] by "..CRIADOR.." carregado! ✨")# Mj-1.0-

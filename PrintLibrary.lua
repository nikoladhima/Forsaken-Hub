-- This function was made by naiko exploits || https://discord.gg/r3rk3a2eSJ
local PrintLibrary = {}

function PrintLibrary:ColoredPrint(Text:string,color:Color3,Icon:table)
    task.spawn(function()
    local TextFinder = "‎".. Text.. (string.sub(game:GetService("HttpService"):GenerateGUID(false),1,10))
    print(TextFinder)
    game.CoreGui:WaitForChild("DevConsoleMaster",1000):WaitForChild("DevConsoleWindow",1000):WaitForChild("DevConsoleUI",1000):WaitForChild("MainView",1000)
    local function update(Parent)
        local loadingLabel = nil
                for index,label in pairs(Parent:GetDescendants()) do 
                     if label:IsA("TextLabel") and string.find(label.Text,TextFinder,1,true) ~= nil then 
                        loadingLabel = label 
                        loadingLabel:SetAttribute("hasbefore",true)
                        loadingLabel.RichText = true
                        local originalTime = string.sub(label.text,1,11)
                        loadingLabel.Text = string.format("<font color='rgb(%s,%s,%s)' size='15'>%s %s </font>", math.round(color.R*255),math.round(color.G*255),math.round(color.B*255),originalTime,Text)
                        if Icon == nil then
                            elseif Icon[1]:lower() == "success" or Icon[1]:lower() == "check" or Icon[1]:lower() == "tick" then
                                if Icon[2] == false then
                                loadingLabel.Parent.image.Image = "rbxassetid://75097763556603"
                                loadingLabel.Parent.image.ImageColor3 = Color3.new(255,255,255)
                                else
                                    loadingLabel.Parent.image.Image = "rbxassetid://87889653826033"
                                    loadingLabel.Parent.image.ImageColor3 = color
                                end
                            end
                            loadingLabel.Parent.image:GetPropertyChangedSignal("Image"):Once(function()
                                loadingLabel.Parent.image.ImageColor3 = Color3.new(255,255,255)
                            end)
                        break
                    end 
                end 
            end
            task.wait(0.009)
            update(game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView"))
            local Done = 0
            task.spawn(function()
                if game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView"):WaitForChild("ClientLog",5).CanvasSize.Y.Offset >= 8500 then
                  game:GetService("LogService").MessageOut:Connect(function(message, messageType)
                    if Done < 22 then
            task.wait(0.01)
            Done = Done + 1
                    update(game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView"))
                    end
    end)
end
    end)
            game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI:WaitForChild("MainView"):WaitForChild("ClientLog",5).ChildAdded:Connect(function(child2)
                update(child2)
         end)
game.CoreGui.DevConsoleMaster.DevConsoleWindow.DevConsoleUI.ChildAdded:Connect(function(child)
    if child.Name == "MainView" then
        task.wait()
        update(child)
        child:WaitForChild("ClientLog",5).ChildAdded:Connect(function(child2)
           update(child2)
    end)
end
end)
end)
end

return PrintLibrary

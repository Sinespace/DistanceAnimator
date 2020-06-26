
myObj = Space.Host.ExecutingObject
myPlayer = Space.Scene.PlayerAvatar

maxDist = maxDist or 20.0
stateName = stateName or "Distance"

lastDist = nil

function onUpdate()
    lastDist = myObj.WorldPosition.Distance(myPlayer.GameObject.WorldPosition)
    if lastDist >= maxDist then
        lastDist = maxDist
    end
    myObj.Animator.PlayInFixedTime(stateName, 0, maxDist - lastDist)
end

myObj.Animator.StartPlayback()

myObj.OnUpdate(onUpdate)

#SingleInstance Force

#Include ./../EQUtilsCommandLine.ahk
#Include ./../EQUtilsClick.ahk
#Include loot_mob.ahk
#Include cornocopia.ahk
SetCapsLockState, off



^F2:: ; CTRL + F2 to start
	campJester()

^+F2:: ; CTRL + Shift + F2 to restart
	run AutoHotkey.exe camping_jester.ahk ; create new

^F3:: ; TESTS
	emote("patiently waits for jester")

campJester() {
	Loop {
		cornocopia(1)
		Loop, 2 {
			castSit(2,7,10) ; burnout
			_buffUp(3)
		}
		emote("patiently waits for the undead jester's presence.")
	}
}

_buffUp(byref numberOfTimes) {
	Loop, %numberOfTimes% {
		targetSelf()
		castSit(3,3,10) ; inferno shield

		targetPet()
		castSit(3,3,5) ; inferno shield
		_lootUp(3)
	}
}

_lootUp(byref numberOfTimes) {
	Loop, %numberOfTimes% {
			autoInventory(5)
			target("an", 2)
			sendKeys("/loot", 2)

			lootMob()

			bagsClose()
			escape(20)
			bagsOpen()

			Sleep, 250
			sit(45)
		}
}

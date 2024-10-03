
// Project: MyFirstGame 
// Created: 2024-10-01

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "MyFirstGame" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

// parte dos background
MenuBackground = LoadImage("Background Menu.png")
imagemgame = LoadImage("fundogame.png")
MenuBackgroundSprite = CreateSprite(MenuBackground)
SetSpriteAnimation(MenuBackgroundSprite, 540, 400, 5)
PlaySprite(MenuBackgroundSprite, 4)

SetSpriteSize(MenuBackgroundSprite, 1024, 768) 

//Alien Outbreak

//parte dos botões
StartButton = LoadImage("StartButton.png")
StartButtonSprite = CreateSprite(StartButton)

SetSpriteSize(StartButtonSprite, 250, 150)
SetSpritePosition(StartButtonSprite, 380, 330)

//parte dos titulos
Tittle = LoadImage("Tittle.png")
TittleSprite = CreateSprite(Tittle)

SetSpriteSize(TittleSprite, 500, 100)
SetSpritePosition(TittleSprite, 270, 220)

//parte das variaveis globais
global spritenave
global tirosprite
global tiroboss1 = 1
global tiroboss2 = 1
global tirospriteboss1
global tirospriteboss2
global inimigo1sprite
global inimigo2sprite
global inimigo3sprite
global Cinimigo1 = 1
global Cinimigo2 = 1
global Cinimigo3 = 1
global bosssprite
global vidassprite
global Menu = 1
global tiro = 1
global vida = 3
global vidabosse = 1
global inimigos = 0
global movboss = 1
global somtiro
global somex
global exsprite
global vidasbosssprite

//nave
naveimagem = LoadImage("nave.png")
spritenave = CreateSprite(naveimagem)
SetSpriteSize(spritenave,150,150)
SetSpritePosition(spritenave,2000,2000)

//tiro
tiroimagem = LoadImage("tiro.png")
tirosprite = createsprite(tiroimagem)
tirospriteboss1 = CreateSprite(tiroimagem)
tirospriteboss2 = CreateSprite(tiroimagem)
SetSpritePosition(tirosprite,2000,2000)
SetSpriteSize(tirosprite,20,70)
SetSpriteSize(tirospriteboss1,20,70)
SetSpriteColor(tirospriteboss1,255,22,22,255)
SetSpriteSize(tirospriteboss1,30,80)
SetSpriteSize(tirospriteboss2,30,80)
SetSpriteColor(tirospriteboss2,255,22,22,255)
SetSpriteSize(tirospriteboss2,20,70)

//inimigos
inimigo1imagem = LoadImage("navealien1.png")
inimigo1sprite = CreateSprite(inimigo1imagem)
SetSpritePosition(inimigo1sprite,2000,2000)
inimigo2imagem = LoadImage("navealien2.png")
inimigo2sprite = CreateSprite(inimigo2imagem)
SetSpritePosition(inimigo2sprite,2000,2000)
inimigo3imagem = LoadImage("navealien3.png")
inimigo3sprite = CreateSprite(inimigo3imagem)
SetSpritePosition(inimigo3sprite,2000,2000)

//vida
vidasimagem = LoadImage("vidas.png")
vidassprite = CreateSprite(vidasimagem)
SetSpritePosition(vidassprite,2000,2000)
SetSpriteSize(vidassprite,133,44)
//boss
bossimagem = LoadImage("boss.png")
bosssprite = createsprite(bossimagem)
SetSpriteAnimation(bosssprite,400,390,5)
playsprite(bosssprite,5)
SetSpritePosition(bosssprite,2000,2000)

//songs
somtiro = LoadSound("tiro.wav")
sommenu = LoadSound("menu.wav")
somex = LoadSound("explosion.wav")
somboss1 = LoadSound("tiroboss.wav")
somboss2 = LoadSound("tiroboss.wav")

PlaySound(sommenu,50,1	)
//PlaySound(somex,50,1)

//explosao
eximage = LoadImage("ex.png")
exsprite = CreateSprite(eximage)
SetSpritePosition(exsprite,2000,2000)
SetSpriteAnimation(exsprite,200,200,4)
SetSpriteSize(exsprite,100,100)

//vidasboss
vidasbossimagem = LoadImage("vidasboss.png")
vidasbosssprite = CreateSprite(vidasbossimagem)
SetSpritePosition(vidasbosssprite,0,100)
SetSpriteVisible(vidasbosssprite,0)
SetSpriteSize(vidasbosssprite,1000,30)
SetSpriteColor(vidasbosssprite,255,22,22,255)


//aliens final 
alien1imagem = LoadImage("alien1.png")
alien1sprite = CreateSprite(alien1imagem)
SetSpriteAnimation(alien1sprite,255,256,6)
PlaySprite(alien1sprite,6)
SetSpritePosition(alien1sprite,2000,2000)
alien2imagem = LoadImage("alien2.png")
alien2sprite = CreateSprite(alien2imagem)
SetSpriteAnimation(alien2sprite,250,250,4)
PlaySprite(alien2sprite,4)


//SetSpriteSize(alien2sprite,200,200)
SetSpritePosition(alien2sprite,2000,2000)

//textofim
fimtextoimagem = LoadImage("fim.png")
fimtextosprite = CreateSprite(fimtextoimagem)
SetSpriteSize(fimtextosprite,550,150)
SetSpritePosition(fimtextosprite,2000,2000)

//somboss
somboss = LoadSound("bossmusica.wav")

//sommidgame
midgamesom = LoadSound("midgame.wav")




do
	
	print(vidabosse)
	
	//verificar se o botão start foi clicado
	if(menu = 1)
		StartGame()
	endif
	// começar o jogo
	if(Menu = 0)
		SetSpriteVisible(StartButtonSprite, 0)
		SetSpriteVisible(TittleSprite, 0)
		SetSpriteImage(MenuBackgroundSprite,imagemgame)
		SetSpritePosition(vidassprite,0,0)
		SetSpritePosition(spritenave,450,600)
		StopSound(sommenu)
		SetSpritePosition(vidassprite,0,0)
		PlaySound(midgamesom)
		menu = -1
	endif
	
	tiroboss()
	if(menu = -1)
		//borda jogo
		borda()
		//tiro da nave  
		tiro()
		//movimento da nave
		navemove()
		//vida
		vida()
		//boss
		boss()
		//dano
		dano()
		//tiro boss
		//inimigos
		enemies()

	endif
	
	
	if(inimigos >= 10 and menu = -1)
		SetSpritePosition(inimigo1sprite,2000,2000)
		SetSpritePosition(inimigo2sprite,2000,2000)
		SetSpritePosition(inimigo3sprite,2000,2000)
		StopSound(sommenu)
		PlaySound(somboss)
		Cinimigo1 = 0
		Cinimigo2 = 0
		Cinimigo3 = 0
		SetSpritePosition(bosssprite,50,50)
		menu = -2
	endif
	
	
	//tiro boss
	if(tiroboss1 = 1 and GetSoundsPlaying(somboss1) = 0 and menu = -2)
		PlaySound(somboss1)
	endif
	if(tiroboss2 = 1 and GetSoundsPlaying(somboss2) = 0 and menu = -2)
		PlaySound(somboss2)
	endif
	
	if(menu = -2)
		SetSpriteVisible(vidasbosssprite,1)
		//borda jogo
		borda()
		//tiro da nave  
		tiro()
		//movimento da nave
		navemove()
		//vida
		vida()
		//boss
		boss()
		//dano
		dano()
		//SetSpritePosition(vidasbosssprite,2000,2000)
		StopSound(midgamesom)
		
	endif
	
	if(vidabosse = 32)
		SetSpritePosition(alien1sprite,0,50)
		SetSpritePosition(alien2sprite,750,500)
		SetSpriteVisible(spritenave,0)
		SetSpriteVisible(vidassprite,0)
		SetSpriteVisible(inimigo1sprite,0)
		SetSpriteVisible(inimigo2sprite,0)
		SetSpriteVisible(inimigo3sprite,0)
		SetSpriteVisible(exsprite,0)
		SetSpriteVisible(bosssprite,0)
		SetSpriteVisible(tirosprite,0)
		SetSpriteVisible(tirospriteboss1,0)
		SetSpriteVisible(tirospriteboss2,0)
		SetSpritePosition(fimtextosprite,270,250)
		if(GetPointerPressed() = 1)
			end
		endif
		menu = -5
	endif
	if(vida = 0)
		SetSpritePosition(alien1sprite,0,50)
		SetSpritePosition(alien2sprite,750,500)
		SetSpriteVisible(spritenave,0)
		SetSpriteVisible(vidassprite,0)
		SetSpriteVisible(inimigo1sprite,0)
		SetSpriteVisible(inimigo2sprite,0)
		SetSpriteVisible(inimigo3sprite,0)
		SetSpriteVisible(bosssprite,0)
		SetSpriteVisible(exsprite,0)
		SetSpriteVisible(tirosprite,0)
		SetSpriteVisible(tirospriteboss1,0)
		SetSpriteVisible(tirospriteboss2,0)
		SetSpritePosition(fimtextosprite,270,250)
		if(GetPointerPressed() = 1)
			end
		endif
		menu  = -5
	endif
    //Print( ScreenFPS() )
    Sync()
loop

function StartGame()	
		if(GetPointerX() >= 370 and GetPointerX() <= 640)
				if(GetPointerY() >= 340 and GetPointerY() <= 450)
					if(GetPointerPressed() = 1)
						Menu = 0
						endif
					endif
			endif
	endfunction

function navemove()
	if(GetRawKeyState(65) = 1)
		SetSpritePosition(spritenave,GetSpriteX(spritenave) -20,GetSpriteY(spritenave))	
	endif
	if(GetRawKeyState(68) = 1)
		SetSpritePosition(spritenave,GetSpriteX(spritenave) +20,GetSpriteY(spritenave))	
	endif

endfunction

function borda()
	if(GetSpriteX(spritenave) > 880 )
		SetSpritePosition(spritenave,880, getspritey(spritenave))
	endif
	if(GetSpriteX(spritenave) < 0 )
		SetSpritePosition(spritenave,0, getspritey(spritenave))
	endif
	
	
endfunction

function tiro()
	if(tiro = 1 and GetPointerPressed() = 1)
		SetSpritePosition(tirosprite,GetSpriteX(spritenave) + 55, GetSpriteY(spritenave) +45)
		PlaySound(somtiro)
		tiro = 2
	endif
	if(tiro = 2)
		SetSpritePosition(tirosprite,getspritex(tirosprite), GetSpriteY(tirosprite) -45)
		if(GetSpriteY(tirosprite) < -70)
			tiro = 1
		endif
	endif
	
	
	
	
	
endfunction

function enemies()
	if(Cinimigo1 = 1)
		SetSpritePosition(inimigo1sprite,Random(0,450), -250)
		Cinimigo1 = 2
	endif
	if(Cinimigo2 = 1)
		SetSpritePosition(inimigo2sprite,Random(500,950), -250)
		Cinimigo2 = 2
	endif
	if(Cinimigo3 = 1)
		SetSpritePosition(inimigo3sprite,Random(0,950), -250)
		Cinimigo3 = 2
	endif
	if(Cinimigo1 = 2)
		SetSpritePosition(inimigo1sprite,getspritex(inimigo1sprite), GetSpriteY(inimigo1sprite)+ 20)
		if(GetSpriteY(inimigo1sprite) > 764)
			SetSpritePosition(inimigo1sprite,Random(0,450), -250)
			Cinimigo1 = 1
		endif
	endif
	if(Cinimigo2 = 2)
		SetSpritePosition(inimigo2sprite,getspritex(inimigo2sprite), GetSpriteY(inimigo2sprite)+ 20)
		if(GetSpriteY(inimigo2sprite) > 764)
			SetSpritePosition(inimigo2sprite,Random(500,950), -250)
			Cinimigo2 = 1
		endif
	endif
	if(Cinimigo3 = 2)
			SetSpritePosition(inimigo3sprite,getspritex(inimigo3sprite), GetSpriteY(inimigo3sprite)+ 30)
		if(GetSpriteY(inimigo3sprite) > 764)
			SetSpritePosition(inimigo3sprite,Random(0,950), -250)
			Cinimigo3 = 1
		endif
	endif
	
endfunction

function dano()
	//inimigo1
	if(GetSpriteCollision(tirosprite,inimigo1sprite) = 1)
		PlaySound(somex,15)
		Cinimigo1 = 1
		inimigos = inimigos + 1
		SetSpritePosition(exsprite,GetSpriteX(inimigo1sprite),GetSpriteY(inimigo1sprite))
		PlaySprite(exsprite)
		SetSpritePosition(tirosprite,2500,2500)
		tiro = 1
	endif
	if(GetSpriteCollision(spritenave,inimigo1sprite) = 1)
		Cinimigo1 = 1
		SetSpritePosition(exsprite,GetSpriteX(spritenave),GetSpriteY(inimigo1sprite))
		PlaySprite(exsprite)
		vida = vida - 1
	endif
	if(GetSpriteCurrentFrame(exsprite) = 3)
		SetSpritePosition(exsprite,2000,2000)
	endif
	//inimigo2
	if(GetSpriteCollision(tirosprite,inimigo2sprite) = 1)
		PlaySound(somex,15)
		Cinimigo2 = 1
		inimigos = inimigos + 1
		SetSpritePosition(exsprite,GetSpriteX(inimigo2sprite),GetSpriteY(inimigo2sprite))
		PlaySprite(exsprite)
		SetSpritePosition(tirosprite,2500,2500)
		tiro = 1
	endif
	if(GetSpriteCollision(spritenave,inimigo2sprite) = 1)
		Cinimigo2 = 1
		SetSpritePosition(exsprite,GetSpriteX(spritenave),GetSpriteY(inimigo1sprite))
		PlaySprite(exsprite)
		vida = vida - 1
	endif
	//inimigo3
	if(GetSpriteCollision(tirosprite,inimigo3sprite) = 1)
		PlaySound(somex,15)
		Cinimigo3 = 1
		inimigos = inimigos + 1
		SetSpritePosition(exsprite,GetSpriteX(inimigo3sprite),GetSpriteY(inimigo3sprite))
		PlaySprite(exsprite)
		SetSpritePosition(tirosprite,2500,2500)
		tiro = 1
	endif
	if(GetSpriteCollision(spritenave,inimigo3sprite) = 1)
		Cinimigo3 = 1
		SetSpritePosition(exsprite,GetSpriteX(spritenave),GetSpriteY(inimigo1sprite))
		PlaySprite(exsprite)
		vida = vida - 1
	endif
	//boss
	if(GetSpriteCollision(tirosprite,bosssprite) = 1)
		vidabosse = vidabosse + 1
		SetSpritePosition(vidasbosssprite,GetSpriteX(vidasbosssprite) - (2*vidabosse),100)
		SetSpritePosition(tirosprite,2500,2500)
		
		tiro = 1
	endif
	
	if(GetSpriteCollision(spritenave,tirospriteboss1) = 1)
		PlaySound(somex,15)
		SetSpritePosition(exsprite,GetSpriteX(spritenave),GetSpriteY(inimigo1sprite))
		PlaySprite(exsprite)
		SetSpritePosition(exsprite,GetSpriteX(spritenave),GetSpriteY(spritenave))
		PlaySprite(exsprite)
		tiroboss1 = 1
		vida = vida - 1
	endif
	if(GetSpriteCollision(spritenave,tirospriteboss2) = 1)
		PlaySound(somex,15)
		SetSpritePosition(exsprite,GetSpriteX(spritenave),GetSpriteY(inimigo1sprite))
		PlaySprite(exsprite)
		SetSpritePosition(exsprite,GetSpriteX(spritenave),GetSpriteY(spritenave))
		PlaySprite(exsprite)
		vida = vida - 1
		tiroboss2 = 1
	endif
	
	
	
	
	
	
	
	
	
endfunction

function vida()
	if(vida = 2)
		SetSpritePosition(vidassprite,-44,0)
	endif
	if(vida = 1)
		SetSpritePosition(vidassprite,-88,0)
	endif
	if(vida = 0)
		SetSpritePosition(vidassprite,-264,0)
	endif
endfunction

function boss()
	if(movboss = 1)
		SetSpritePosition(bosssprite,GetSpriteX(bosssprite) + 15, GetSpriteY(bosssprite))
		if(GetSpriteX(bosssprite) > 700)
			movboss = 2
		endif
	endif
	if(movboss = 2)
		SetSpritePosition(bosssprite,GetSpriteX(bosssprite) - 15, GetSpriteY(bosssprite))
		if(GetSpriteX(bosssprite) < 0)
			movboss = 1
		endif
	endif
	
	
	
endfunction

function tiroboss()
	
	if(tiroboss1 = 1)
		SetSpritePosition(tirospriteboss1,GetSpriteX(bosssprite),GetSpriteY(bosssprite)+200)
		tiroboss1 = 2
	endif
	
	if(tiroboss2 = 1)
		SetSpritePosition(tirospriteboss2,GetSpriteX(bosssprite) + 350,GetSpriteY(bosssprite)+ 200)
		tiroboss2 = 2
	endif
	
	if(tiroboss1 = 2)
		SetSpritePosition(tirospriteboss1,GetSpriteX(tirospriteboss1),GetSpriteY(tirospriteboss1) + 25)
		if(getspritey(tirospriteboss1) > 764)
			tiroboss1 = 1
		endif
	endif
	
	if(tiroboss2 = 2)
		SetSpritePosition(tirospriteboss2,GetSpriteX(tirospriteboss2),GetSpriteY(tirospriteboss2) + 25)
		if(getspritey(tirospriteboss2) > 764)
			tiroboss2 = 1
		endif
	endif
	
endfunction


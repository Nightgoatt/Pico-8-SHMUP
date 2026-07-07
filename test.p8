pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
function _init()
	cls()
	
	starx={}
	stary={}
	starspd={}
	
	comet={}
	cometrspd={}
	spdy0=10
	spdy1=1
	
	for i=1,100 do
		add(starx,flr(rnd(128)))
		add(stary,flr(rnd(128)))
		add(starspd,rnd(1.5)+0.5)
	end
	
	for i=1,5 do
		add(comet,{
		x=flr(rnd(128)),
		y=-rnd(128),
		spd=rnd(3)+2,
		wait=flr(rnd(90))})
	end
	
end

function _update()
		
end

function _draw()
	cls()
	starfield()
	animatestars()
	comets()
	
end
-->8
--stars test
function starfield()
	for i=1,#starx do
		local scol=6
		
		--change stars colors
		if starspd[i]<1 then
			scol=13
		elseif starspd[i]<1.5 then
			scol=1
		end
		
		pset(starx[i],stary[i],scol)
	end
end
	
	--animate stars
function animatestars()
	for i=1,#stary do
		local sy=stary[i]
		sy+=starspd[i]
					
		if sy>128 then
			sy-=128
		end
		
			stary[i]=sy
		end
end

--comets
function comets()
			for c in all(comet) do
				line(c.x,c.y,c.x,c.y+8,10)
				
				c.y+=c.spd
				
				if c.y>128 then
					c.y=-rnd(128)
					c.x=flr(rnd(128))
					c.spd=rnd(3)+2
				end
				
				if c.wait>0 then
					c.wait-=1
				else
					c.y+=c.spd
				end
				
			end
			
			
			
			
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

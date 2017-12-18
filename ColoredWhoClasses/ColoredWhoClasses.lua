ColoredWhoClasses = AceLibrary('AceAddon-2.0'):new('AceHook-2.1')

function ColoredWhoClasses:OnEnable()
	self:SecureHook('WhoList_Update')
end

function ColoredWhoClasses:WhoList_Update()
	local whoOffset = FauxScrollFrame_GetOffset(WhoListScrollFrame);
	for i=1, WHOS_TO_DISPLAY do
		local whoIndex = whoOffset + i;
		local _, _, _, _, class = GetWhoInfo(whoIndex);
		if not class then break end
		local color_r, color_g, color_b = AceLibrary('Babble-Class-2.2'):GetColor(class)
		getglobal('WhoFrameButton'..i..'Class'):SetTextColor(color_r, color_g, color_b);
	end
end
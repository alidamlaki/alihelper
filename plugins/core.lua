--Begin Core.lua By #BeyondTeam
local function getindex(t,id) 
	for i,v in pairs(t) do 
		if v == id then 
			return i 
		end 
	end 
	return nil 
end 

local function reload_plugins( ) 
	plugins = {} 
	load_plugins() 
end

--By @SoLiD021
local function already_sudo(user_id)
	for k,v in pairs(_config.sudo_users) do
		if user_id == v then
			return k
		end
	end
	-- If not found
	return false
end

--By @SoLiD
local function sudolist(msg)
	local sudo_users = _config.sudo_users
	local text = "Sudo Users :\n"
	for i=1,#sudo_users do
		text = text..i.." - "..sudo_users[i].."\n"
	end
	return text
end

local function options(msg, GP_id)
local hash = "gp_lang:"..GP_id
local lang = redis:get(hash) 
     if not lang then
	 text = '_Welcome To_ *Group Option*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Settings", callback_data="/settings1:"..GP_id}
		},
		{
			{text = '> More ', callback_data = '/more:'..GP_id}
		},
		{
			{text = '> About Us ', callback_data = '/beyond:'..GP_id}
		},
		{
			{text= '> Back' ,callback_data = '/lang:'..GP_id}
		}				
	}
  elseif lang then
	 text = '_⚙ اعدادات تحكم في البوت بازرار الشفافة_'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "🔧 اعدادات", callback_data="/settings1:"..GP_id}
		},
		{
			{text = '🔰 المزيد', callback_data = '/more:'..GP_id}
		},
		{
			{text = '👥 الدعم', callback_data = '/beyond:'..GP_id}
		},
		{
			{text= '❎ خروج' ,callback_data = '/exit:'..GP_id}
		}				
	}
  end
    edit_inline(msg.message_id, text, keyboard)
end

           ---------------EN-----------------
function moresetting(msg, data, GP_id)
local hash = "gp_lang:"..GP_id
local lang = redis:get(hash) 
local settings = data[tostring(GP_id)]["settings"]
    if not lang then
 text = '_Welcome To_ *More Settings*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = '> Flood Sensitivity ', callback_data = 'BeyondTeam'}
		},
		{
			{text = "➕", callback_data='/floodup:'..GP_id}, 
			{text = tostring(settings.num_msg_max), callback_data="BeyondTeam"},
			{text = "➖", callback_data='/flooddown:'..GP_id}
		},
		{
			{text = '> Character Sensitivity ', callback_data = 'BeyondTeam'}
		},
		{
			{text = "➕", callback_data='/charup:'..GP_id}, 
			{text = tostring(settings.set_char), callback_data="BeyondTeam"},
			{text = "➖", callback_data='/chardown:'..GP_id}
		},
		{
			{text = '> Flood Check Time ', callback_data = 'BeyondTeam'}
		},
		{
			{text = "➕", callback_data='/floodtimeup:'..GP_id}, 
			{text = tostring(settings.time_check), callback_data="BeyondTeam"},
			{text = "➖", callback_data='/floodtimedown:'..GP_id}
		},
		{
			{text = '> Back ', callback_data = '/settings1:'..GP_id}
		}				
	}
    elseif lang then
 text = '_⛔️ اعدادات الهجوم و عدد حروف الرسائل_'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = '⛔ ️حد عدد رسائل الهجوم', callback_data = 'BeyondTeam'}
		},
		{
			{text = "➕", callback_data='/floodup:'..GP_id}, 
			{text = tostring(settings.num_msg_max), callback_data="BeyondTeam"},
			{text = "➖", callback_data='/flooddown:'..GP_id}
		},
		{
			{text = '📨 حد عدد حروف رسائل', callback_data = 'BeyondTeam'}
		},
		{
			{text = "➕", callback_data='/charup:'..GP_id}, 
			{text = tostring(settings.set_char), callback_data="BeyondTeam"},
			{text = "➖", callback_data='/chardown:'..GP_id}
		},
		{
			{text = '⏳ حد ثواني بين رسائل الهجوم', callback_data = 'BeyondTeam'}
		},
		{
			{text = "➕", callback_data='/floodtimeup:'..GP_id}, 
			{text = tostring(settings.time_check), callback_data="BeyondTeam"},
			{text = "➖", callback_data='/floodtimedown:'..GP_id}
		},
		{
			{text = '> Back ', callback_data = '/settings1:'..GP_id}
		}				
	}
     end
    edit_inline(msg.message_id, text, keyboard)
end

function setting(msg, data, GP_id)
local hash = "gp_lang:"..GP_id
local lang = redis:get(hash) 
local settings = data[tostring(GP_id)]["settings"]
		if settings.edit then
		edit = settings.edit
	else
		edit = 'غير مفعل'
	end
		if settings.text then
		Ltext = settings.text
	else
		Ltext = 'غير مفعل'
	end
		if settings.link then
		links = settings.link
	else
		links = 'غير مفعل'
	end
		if settings.tag then
		tags = settings.tag
	else
		tags = 'غير مفعل'
	end
		if settings.mention then
		mentions = settings.mention
	else
		mentions = 'غير مفعل'
	end
		if settings.arabic then
		arabic = settings.arabic
	else
		arabic = 'غير مفعل'
	end
		if settings.webpage then
		webpages = settings.webpage
	else
		webpages = 'غير مفعل'
	end
    if not lang then
 text = '_Welcome To_ *Group Settings*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Edit Message : "..edit, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/editwarn:'..GP_id}, 
			{text = "Kick", callback_data="/editkick:"..GP_id},
			{text = "Ban", callback_data='/editsilent:'..GP_id}, 
			{text = "Del", callback_data="/editdel:"..GP_id},
			{text = "Ok", callback_data="/editok:"..GP_id}
		},
		{
			{text = "> Text Message : "..Ltext, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/textwarn:'..GP_id}, 
			{text = "Kick", callback_data="/textkick:"..GP_id},
			{text = "Ban", callback_data='/textsilent:'..GP_id}, 
			{text = "Del", callback_data="/textdel:"..GP_id},
			{text = "Ok", callback_data="/textok:"..GP_id}
		},
		{
			{text = "> Links Message : "..links, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/linkwarn:'..GP_id}, 
			{text = "Kick", callback_data="/linkkick:"..GP_id},
			{text = "Ban", callback_data='/linksilent:'..GP_id}, 
			{text = "Del", callback_data="/linkdel:"..GP_id},
			{text = "Ok", callback_data="/linkok:"..GP_id}
		},
		{
			{text = "> Tags Message : "..tags, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/tagwarn:'..GP_id}, 
			{text = "Kick", callback_data="/tagkick:"..GP_id},
			{text = "Ban", callback_data='/tagsilent:'..GP_id}, 
			{text = "Del", callback_data="/tagdel:"..GP_id},
			{text = "Ok", callback_data="/tagok:"..GP_id}
		},
		{
			{text = "> Mention Message : "..mentions, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/mentionwarn:'..GP_id}, 
			{text = "Kick", callback_data="/mentionkick:"..GP_id},
			{text = "Ban", callback_data='/mentionsilent:'..GP_id}, 
			{text = "Del", callback_data="/mentiondel:"..GP_id},
			{text = "Ok", callback_data="/mentionok:"..GP_id}
		},
		{
			{text = "> Arabic Message : "..arabic, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/arabicwarn:'..GP_id}, 
			{text = "Kick", callback_data="/arabickick:"..GP_id},
			{text = "Ban", callback_data='/arabicsilent:'..GP_id}, 
			{text = "Del", callback_data="/arabicdel:"..GP_id},
			{text = "Ok", callback_data="/arabicok:"..GP_id}
		},
		{
			{text = "> Webpage Message : "..webpages, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/webwarn:'..GP_id}, 
			{text = "Kick", callback_data="/webkick:"..GP_id},
			{text = "Ban", callback_data='/websilent:'..GP_id}, 
			{text = "Del", callback_data="/webdel:"..GP_id},
			{text = "Ok", callback_data="/webok:"..GP_id}
		},
     {
			{text = "> Next Page", callback_data="/settings2:"..GP_id}
		},
		{
			{text = '> More Settings ', callback_data = '/moresettings:'..GP_id}
		},
		{
			{text = '> Back ', callback_data = '/option:'..GP_id}
		}				
	}
     elseif lang then
 text = '_ 🔑 اعدادات قفل و فتح_ *(*`بالطرد و تحذير و الحظر و حذف رسالة`*)*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "✂️ قفل التعديل : "..edit, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/editwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/editkick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/editsilent:'..GP_id},
			{text = "🗑 بالحذف", callback_data="/editdel:"..GP_id},
			{text = "🔓 الغاء القفل", callback_data="/editok:"..GP_id}
		},
		{
			{text = "📝 قفل النصوص : "..Ltext, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/textwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/textkick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/textsilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/textdel:"..GP_id},
			{text = "🔓 الغاء القفل", callback_data="/textok:"..GP_id}
		},
		{
			{text = "📎 قفل الروابط : "..links, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/linkwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/linkkick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/linksilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/linkdel:"..GP_id},
			{text = "🔓 الغاء القفل", callback_data="/linkok:"..GP_id}
		},
		{
			{text = "🔘 قفل المعرفات : "..tags, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/tagwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/tagkick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/tagsilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/tagdel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/tagok:"..GP_id}
		},
		{
			{text = "🌀 قفل المنشن : "..mentions, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/mentionwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/mentionkick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/mentionsilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/mentiondel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/mentionok:"..GP_id}
		},
		{
			{text = "⚪️ قفل العربية : "..arabic, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/arabicwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/arabickick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/arabicsilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/arabicdel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/arabicok:"..GP_id}
		},
		{
			{text = "🌐 قفل روابط المواقع : "..webpages, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/webwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/webkick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/websilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/webdel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/webok:"..GP_id}
		},
     {
			{text = '⏩ الصفحة التالية', callback_data="/settings2:"..GP_id}
		},
		{
			{text = '⚙ اعدادات اخرى ', callback_data = '/moresettings:'..GP_id}
		},
		{
			{text = '🔙 رجوع ', callback_data = '/option:'..GP_id}
		}				
	}
   end
    edit_inline(msg.message_id, text, keyboard)
end

function setting1(msg, data, GP_id)
local hash = "gp_lang:"..GP_id
local lang = redis:get(hash) 
local settings = data[tostring(GP_id)]["settings"]
		if settings.markdown then
		markdowns = settings.markdown
	else
		markdowns = 'غير مفعل'
	end
		if settings.forward then
		forwards = settings.forward
	else
		forwards = 'غير مفعل'
	end
		if settings.sticker then
		stickers = settings.sticker
	else
		stickers = 'غير مفعل'
	end
		if settings.video then
		videos = settings.video
	else
		videos = 'غير مفعل'
	end
		if settings.audio then
		audios = settings.audio
	else
		audios = 'غير مفعل'
	end
		if settings.voice then
		voices = settings.voice
	else
		voices = 'غير مفعل'
	end
		if settings.photo then
		photos = settings.photo
	else
		photos = 'غير مفعل'
	end
   if not lang then
 text = '_Welcome To_ *Group Settings*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Markdown Message : "..markdowns, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/markwarn:'..GP_id}, 
			{text = "Kick", callback_data="/markkick:"..GP_id},
			{text = "Ban", callback_data='/marksilent:'..GP_id}, 
			{text = "Del", callback_data="/markdel:"..GP_id},
			{text = "Ok", callback_data="/markok:"..GP_id}
		},
		{
			{text = "> Forward Message : "..forwards, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/fwdwarn:'..GP_id}, 
			{text = "Kick", callback_data="/fwdkick:"..GP_id},
			{text = "Ban", callback_data='/fwdsilent:'..GP_id}, 
			{text = "Del", callback_data="/fwddel:"..GP_id},
			{text = "Ok", callback_data="/fwdok:"..GP_id}
		},
		{
			{text = "> Sticker Policy : "..stickers, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/stickerwarn:'..GP_id}, 
			{text = "Kick", callback_data="/stickerkick:"..GP_id},
			{text = "Ban", callback_data='/stickersilent:'..GP_id}, 
			{text = "Del", callback_data="/stickerdel:"..GP_id},
			{text = "Ok", callback_data="/stickerok:"..GP_id}
		},
		{
			{text = "> Video Policy : "..videos, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/videowarn:'..GP_id}, 
			{text = "Kick", callback_data="/videokick:"..GP_id},
			{text = "Ban", callback_data='/videosilent:'..GP_id}, 
			{text = "Del", callback_data="/videodel:"..GP_id},
			{text = "Ok", callback_data="/videook:"..GP_id}
		},
		{
			{text = "> Audio Policy : "..audios, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/audiowarn:'..GP_id}, 
			{text = "Kick", callback_data="/audiokick:"..GP_id},
			{text = "Ban", callback_data='/audiosilent:'..GP_id}, 
			{text = "Del", callback_data="/audiodel:"..GP_id},
			{text = "Ok", callback_data="/audiook:"..GP_id}
		},
		{
			{text = "> Voice Policy : "..voices, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/voicewarn:'..GP_id}, 
			{text = "Kick", callback_data="/voicekick:"..GP_id},
			{text = "Ban", callback_data='/voicesilent:'..GP_id}, 
			{text = "Del", callback_data="/voicedel:"..GP_id},
			{text = "Ok", callback_data="/voiceok:"..GP_id}
		},
		{
			{text = "> Photo Policy : "..photos, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/photowarn:'..GP_id}, 
			{text = "Kick", callback_data="/photokick:"..GP_id},
			{text = "Ban", callback_data='/photosilent:'..GP_id}, 
			{text = "Del", callback_data="/photodel:"..GP_id},
			{text = "Ok", callback_data="/photook:"..GP_id}
		},
     {
			{text = "> Next Page", callback_data="/settings3:"..GP_id},
			{text = '> Previous Page ', callback_data = '/settings1:'..GP_id}
		},
		{
			{text = '> Back To Option ', callback_data = '/option:'..GP_id}
		}				
	}
    elseif lang then
 text = '_ 🔑 اعدادات قفل و فتح_ *(*`بالطرد و تحذير و الحظر و حذف رسالة`*)*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "🖇 قفل الماركداون : "..markdowns, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/markwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/markkick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/marksilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/markdel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/markok:"..GP_id}
		},
		{
			{text = "♻️ قفل اعادة التوجيه : "..forwards, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/fwdwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/fwdkick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/fwdsilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/fwddel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/fwdok:"..GP_id}
		},
		{
			{text = "💈 قفل الملصقات : "..stickers, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/stickerwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/stickerkick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/stickersilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/stickerdel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/stickerok:"..GP_id}
		},
		{
			{text = "📹 قفل الفيديو : "..videos, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/videowarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/videokick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/videosilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/videodel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/videook:"..GP_id}
		},
		{
			{text = "🎧 قفل الصوتيات : "..audios, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/audiowarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/audiokick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/audiosilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/audiodel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/audiook:"..GP_id}
		},
		{
			{text = "🎤 قفل التسجيلات : "..voices, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/voicewarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/voicekick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/voicesilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/voicedel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/voiceok:"..GP_id}
		},
		{
			{text = "🖼 قفل الصور : "..photos, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/photowarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/photokick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/photosilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/photodel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/photook:"..GP_id}
		},
     {
			{text = "الصفحة السابقة ⏪", callback_data="/settings1:"..GP_id},
			{text = '⏩ الصفحة التالية', callback_data = '/settings3:'..GP_id}
		},
		{
			{text = '🔙 رجوع للجميع اعدادات ', callback_data = '/option:'..GP_id}
		}				
	}
    end
    edit_inline(msg.message_id, text, keyboard)
end

function setting2(msg, data, GP_id)
local hash = "gp_lang:"..GP_id
local lang = redis:get(hash) 
local settings = data[tostring(GP_id)]["settings"]
		if settings.document then
		documents = settings.document
	else
		documents = 'غير مفعل'
	end
		if settings.location then
		locations = settings.location
	else
		locations = 'غير مفعل'
	end
		if settings.gif then
		gifs = settings.gif
	else
		gifs = 'غير مفعل'
	end
		if settings.chat then
		chats = settings.chat
	else
		chats = 'غير مفعل'
	end
		if settings.view then
		views = settings.view
	else
		views = 'غير مفعل'
	end
		if settings.contact then
		contacts = settings.contact
	else
		contacts = 'غير مفعل'
	end
		if settings.inline then
		inlines = settings.inline
	else
		inlines = 'غير مفعل'
	end
    if not lang then
 text = '_Welcome To_ *Group Settings*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Document Policy : "..documents, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/docwarn:'..GP_id}, 
			{text = "Kick", callback_data="/dockick:"..GP_id},
			{text = "Ban", callback_data='/docsilent:'..GP_id}, 
			{text = "Del", callback_data="/docdel:"..GP_id},
			{text = "Ok", callback_data="/docok:"..GP_id}
		},
		{
			{text = "> Location Policy : "..locations, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/locwarn:'..GP_id}, 
			{text = "Kick", callback_data="/lockick:"..GP_id},
			{text = "Ban", callback_data='/locsilent:'..GP_id}, 
			{text = "Del", callback_data="/locdel:"..GP_id},
			{text = "Ok", callback_data="/locok:"..GP_id}
		},
		{
			{text = "> Gif Policy : "..gifs, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/gifwarn:'..GP_id}, 
			{text = "Kick", callback_data="/gifkick:"..GP_id},
			{text = "Ban", callback_data='/gifsilent:'..GP_id}, 
			{text = "Del", callback_data="/gifdel:"..GP_id},
			{text = "Ok", callback_data="/gifok:"..GP_id}
		},
		{
			{text = "> Chat Policy : "..chats, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/chatwarn:'..GP_id}, 
			{text = "Kick", callback_data="/chatkick:"..GP_id},
			{text = "Ban", callback_data='/chatsilent:'..GP_id}, 
			{text = "Del", callback_data="/chatdel:"..GP_id},
			{text = "Ok", callback_data="/chatok:"..GP_id}
		},
		{
			{text = "> View Policy : "..views, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/viewwarn:'..GP_id}, 
			{text = "Kick", callback_data="/viewkick:"..GP_id},
			{text = "Ban", callback_data='/viewsilent:'..GP_id}, 
			{text = "Del", callback_data="/viewdel:"..GP_id},
			{text = "Ok", callback_data="/viewok:"..GP_id}
		},
		{
			{text = "> Contact Policy : "..contacts, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/contwarn:'..GP_id}, 
			{text = "Kick", callback_data="/contkick:"..GP_id},
			{text = "Ban", callback_data='/contsilent:'..GP_id}, 
			{text = "Del", callback_data="/contdel:"..GP_id},
			{text = "Ok", callback_data="/contok:"..GP_id}
		},
		{
			{text = "> Inline Policy : "..inlines, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/inlinewarn:'..GP_id}, 
			{text = "Kick", callback_data="/inlinekick:"..GP_id},
			{text = "Ban", callback_data='/inlinesilent:'..GP_id}, 
			{text = "Del", callback_data="/inlinedel:"..GP_id},
			{text = "Ok", callback_data="/inlineok:"..GP_id}
		},
     {
			{text = "> Next Page", callback_data="/settings4:"..GP_id},
			{text = '> Previous Page ', callback_data = '/settings2:'..GP_id}
		},
		{
			{text = '> Back To Option ', callback_data = '/option:'..GP_id}
		}				
	}
   elseif lang then
local text = '_ 🔑 اعدادات قفل و فتح_ *(*`بالطرد و تحذير و الحظر و حذف رسالة`*)*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "📦 قفل الملفات : "..documents, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/docwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/dockick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/docsilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/docdel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/docok:"..GP_id}
		},
		{
			{text = "📡 قفل مشاركة الموقع : "..locations, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/locwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/lockick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/locsilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/locdel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/locok:"..GP_id}
		},
		{
			{text = "🎭 قفل صور متحركة : "..gifs, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/gifwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/gifkick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/gifsilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/gifdel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/gifok:"..GP_id}
		},
		{
			{text = "🔕 قفل المجموعة : "..chats, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/chatwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/chatkick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/chatsilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/chatdel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/chatok:"..GP_id}
		},
		{
			{text = "🔁 قفل اعادة توجيه من قنوات : "..views, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/viewwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/viewkick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/viewsilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/viewdel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/viewok:"..GP_id}
		},
		{
			{text = "📒 قفل جهات اتصال : "..contacts, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/contwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/contkick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/contsilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/contdel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/contok:"..GP_id}
		},
		{
			{text = "🔗 قفل ازرار شفافة : "..inlines, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/inlinewarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/inlinekick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/inlinesilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/inlinedel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/inlineok:"..GP_id}
		},
     {
			{text = "الصفحة السابقة ⏪", callback_data="/settings2:"..GP_id},
			{text = '⏩ الصفحة التالية', callback_data = '/settings4:'..GP_id}
		},
		{
			{text = '🔙 رجوع للجميع اعدادات ', callback_data = '/option:'..GP_id}
		}				
	}
    end
    edit_inline(msg.message_id, text, keyboard)
end

function setting3(msg, data, GP_id)
local hash = "gp_lang:"..GP_id
local lang = redis:get(hash) 
local settings = data[tostring(GP_id)]["settings"]
		if settings.keyboard then
		keyboards = settings.keyboard
	else
		keyboards = 'غير مفعل'
	end
		if settings.flood then
		antiflood = settings.flood
	else
		antiflood = 'disable'
	end
		if settings.spam then
		antispam = settings.spam
	else
		antispam = 'disable'
	end
		if settings.welcome then
		welcome = settings.welcome
	else
		welcome = 'no'
	end
		if settings.lock_pin then
		lock_pin = settings.lock_pin
	else
		lock_pin = 'no'
	end
		if settings.lock_tgservice then
		lock_tgservice = settings.lock_tgservice
	else
		lock_tgservice = 'no'
	end
		if settings.lock_bots then
		lock_bots = settings.lock_bots
	else
		lock_bots = 'no'
	end
   if not lang then
 text = '_Welcome To_ *Group Settings*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> Keyboard Policy : "..keyboards, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/keywarn:'..GP_id}, 
			{text = "Kick", callback_data="/keykick:"..GP_id},
			{text = "Ban", callback_data='/keysilent:'..GP_id}, 
			{text = "Del", callback_data="/keydel:"..GP_id},
			{text = "Ok", callback_data="/keyok:"..GP_id}
		},
		{
			{text = "> Anti Spam : "..antispam, callback_data='BeyondTeam'}
		},
		{
			{text = "Warn", callback_data='/spamwarn:'..GP_id}, 
			{text = "Kick", callback_data="/spamkick:"..GP_id},
			{text = "Ban", callback_data='/spamsilent:'..GP_id}, 
			{text = "Del", callback_data="/spamdel:"..GP_id},
			{text = "Ok", callback_data="/spamok:"..GP_id}
		},
		{
			{text = "> Anti Flood : "..antiflood, callback_data='BeyondTeam'}
		},
		{
			{text = "Ban", callback_data='/floodsilent:'..GP_id}, 
			{text = "Kick", callback_data="/floodkick:"..GP_id},
			{text = "Disable", callback_data="/floodok:"..GP_id}
		},
		{
			{text = "> Group Welcome", callback_data='BeyondTeam'}, 
			{text = welcome, callback_data="/welcome:"..GP_id}
		},
		{
			{text = "> Lock Pin", callback_data='BeyondTeam'}, 
			{text = lock_pin, callback_data="/lockpin:"..GP_id}
		},
		{
			{text = "> Lock TGService", callback_data='BeyondTeam'}, 
			{text = lock_tgservice, callback_data="/locktgservice:"..GP_id}
		},
		{
			{text = "> Bots Protection", callback_data='BeyondTeam'}, 
			{text = lock_bots, callback_data="/lockbots:"..GP_id}
		},
     {
			{text = '> Previous Page ', callback_data = '/settings3:'..GP_id}
		},
		{
			{text = '> Back To Option ', callback_data = '/option:'..GP_id}
		}				
	}
elseif lang then
 text = '_ 🔑 اعدادات قفل و فتح_ *(*`بالطرد و تحذير و الحظر و حذف رسالة`*)*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "⌨ قفل الكيبورد : "..keyboards, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/keywarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/keykick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/keysilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/keydel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/keyok:"..GP_id}
		},
		{
			{text = "💠 قفل السبام : "..antispam, callback_data='BeyondTeam'}
		},
		{
			{text = "⚠️️ بالتحذير", callback_data='/spamwarn:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/spamkick:"..GP_id}
      },
      {
			{text = "🔇 بالتصميت", callback_data='/spamsilent:'..GP_id}, 
			{text = "🗑 بالحذف", callback_data="/spamdel:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/spamok:"..GP_id}
		},
		{
			{text = "🛡 قفل التكرار : "..antiflood, callback_data='BeyondTeam'}
		},
		{
			{text = "🔇 بالتصميت", callback_data='/floodsilent:'..GP_id}, 
			{text = "⛔ بالطرد", callback_data="/floodkick:"..GP_id},
			{text ="🔓 الغاء القفل", callback_data="/floodok:"..GP_id}
		},
		{
		 {text = welcome, callback_data="/welcome:"..GP_id},
			{text = "🎉 الترحيب", callback_data='BeyondTeam'}
		},
		{ 
			{text = lock_pin, callback_data="/lockpin:"..GP_id},
		 {text = "📌 قفل التثبيت", callback_data='BeyondTeam'}
		},
		{
			{text = lock_tgservice, callback_data="/locktgservice:"..GP_id},
			{text = "⤵️ قفل الاشعارات", callback_data='BeyondTeam'}
		},
		{
		{text = lock_bots, callback_data="/lockbots:"..GP_id},
		{text = "🤖 قفل البوتات", callback_data='BeyondTeam'}
		},
     {
			{text = 'الصفحة السابقة ⏪ ', callback_data = '/settings3:'..GP_id}
		},
		{
			{text = '🔙 رجوع للجميع اعدادات ', callback_data = '/option:'..GP_id}
		}				
	}
    end
    edit_inline(msg.message_id, text, keyboard)
end

local function run(msg, matches)
	local data = load_data(_config.moderation.data)
--------------Begin Msg Matches---------------
	if matches[1] == "sudolist" and is_sudo(msg) then
		return sudolist(msg)
	end
	if (matches[1] == "visudo" or matches[1] == "desudo" or matches[1] == "سودو" or matches[1] == "حذف سودو") and msg.from.id == _cliconfig.master_id then
		sleep(1)
		_cliconfig = load_cliconfig( )
	end
	if (matches[1] == "adminprom" or matches[1] == "admindem" or matches[1] == "ادمین" or matches[1] == "حذف ادمین") and is_sudo(msg) then
		sleep(1)
		_cliconfig = load_cliconfig( )
	end
	if tonumber(msg.from.id) == sudo_id then
		if matches[1]:lower() == "setsudo" then
			if matches[2] and not msg.reply_to_message then
				local user_id = matches[2]
				if already_sudo(tonumber(user_id)) then
					return 'User '..user_id..' is already sudo users'
				else
					table.insert(_config.sudo_users, tonumber(user_id)) 
					print(user_id..' added to sudo users') 
					save_config() 
					reload_plugins(true) 
					return "User "..user_id.." added to sudo users" 
				end
		elseif not matches[2] and msg.reply_to_message then
			local user_id = msg.reply_to_message.from.id
			if already_sudo(tonumber(user_id)) then
				return 'User '..user_id..' is already sudo users'
			else
				table.insert(_config.sudo_users, tonumber(user_id)) 
				print(user_id..' added to sudo users') 
				save_config() 
				reload_plugins(true) 
				return "User "..user_id.." added to sudo users" 
			end
		end
	end
	if matches[1]:lower() == "remsudo" then
	if matches[2] and not msg.reply_to_message then
		local user_id = tonumber(matches[2]) 
		if not already_sudo(user_id) then
			return 'User '..user_id..' is not sudo users'
		else
			table.remove(_config.sudo_users, getindex( _config.sudo_users, k)) 
			print(user_id..' removed from sudo users') 
			save_config() 
			reload_plugins(true) 
			return "User "..user_id.." removed from sudo users"
		end
	elseif not matches[2] and msg.reply_to_message then
		local user_id = tonumber(msg.reply_to_message.from.id) 
		if not already_sudo(user_id) then
			return 'User '..user_id..' is not sudo users'
		else
			table.remove(_config.sudo_users, getindex( _config.sudo_users, k)) 
			print(user_id..' removed from sudo users') 
			save_config() 
			reload_plugins(true) 
			return "User "..user_id.." removed from sudo users"
		end
	end
	end
	end
--------------End Msg Matches---------------

--------------Begin Inline Query---------------
if msg.query and msg.query:match("-%d+") and is_sudo(msg) then
	local chatid = "-"..msg.query:match("%d+")
	keyboard = {}
	keyboard.inline_keyboard = {
		{
		{text = ' 📋 الاوامر ', callback_data = '/help:'..chatid}
		},
		{
			{text = ' 🔧 الحماية بازرار شفافة ', callback_data = '/persian:'..chatid}
		},
		{
			{text= '✖️ خروج' ,callback_data = '/exit:'..chatid}
		}					
	}
	send_inline(msg.id,'settings','Group Option','Tap Here',' ⚙ اعدادات AdamBot الشفافة',keyboard)
end
if msg.cb then
local hash = "gp_lang:"..matches[2]
local lang = redis:get(hash) 
	if matches[1] == '/lang' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
    elseif not data[tostring(matches[2])] then
     if not lang then
		edit_inline(msg.message_id, "`Group Is Not Added`")
   elseif lang then
		edit_inline(msg.message_id, "_گروه به لیست مدیریتی ربات اضافه نشده_")
   end
	else
	local text = '_Please Select An_ *Language*'
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "> English", callback_data="/english:"..matches[2]},
			{text = '> فارسی ', callback_data = '/persian:'..matches[2]}
		},
		{
			{text= '> Exit' ,callback_data = '/exit:'..matches[2]}
		}				
	}
    edit_inline(msg.message_id, text, keyboard)
	end
end
	if matches[1] == '/english' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
    redis:del(hash)
   sleep(1)
	options(msg, matches[2])
	end
end
	if matches[1] == '/persian' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
    redis:set(hash, true)
   sleep(1)
	options(msg, matches[2])
	end
end
	if matches[1] == '/option' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
	options(msg, matches[2])
	end
end
if matches[1] == '/settings1' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/settings2' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/settings3' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/settings4' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/moresettings' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		moresetting(msg, data, matches[2])
	end
end

          -- ####################### Settings ####################### --
	  --#######Edit Settings#######--
if matches[1] == '/editwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Edit Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل التعديل بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["edit"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/editdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Edit Status Changed To : Del'
   elseif lang then
			text = 'تم قفل التعديل بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["edit"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/editkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Edit Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل التعديل بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["edit"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/editsilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Edit Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل التعديل بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["edit"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/editok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local editok = data[tostring(matches[2])]["settings"]["edit"]
		if editok == "غير مفعل" then
   if not lang then
			text = 'Edit Message Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل التعديل غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'This Group Now Allow Edit Message'
   elseif lang then
			text = 'تم الغاء قفل التعديل 🔓'
    end
			data[tostring(matches[2])]["settings"]["edit"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
		  --#######Text Settings#######--
if matches[1] == '/textwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Text Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل النصوص بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["text"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/textdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Text Status Changed To : Del'
   elseif lang then
			text = 'تم قفل النصوص بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["text"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/textkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Text Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل النصوص بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["text"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/textsilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Text Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل النصوص بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["text"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/textok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["text"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Text Message Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل النصوص غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'This Group Now Allow Text Message'
   elseif lang then
			text = 'تم الغاء قفل النصوص 🔓'
    end
			data[tostring(matches[2])]["settings"]["text"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
		  --#######Link Settings #######--
if matches[1] == '/linkwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Link Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل الروابط بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["link"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/linkdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Link Status Changed To : Del'
   elseif lang then
			text = 'تم قفل الروابط بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["link"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/linkkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Link Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل الروابط بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["link"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/linksilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Link Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل الروابط بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["link"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/linkok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["link"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Link Posting Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل الروابط غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'This Group Now Allow Link Posting'
   elseif lang then
			text = 'تم الغاء قفل الروابط 🔓'
    end
			data[tostring(matches[2])]["settings"]["link"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
		  --#######Tags Settings #######--
if matches[1] == '/tagwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Tags Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل المعرفات بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["tag"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/tagdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Tags Status Changed To : Del'
   elseif lang then
			text = 'تم قفل المعرفات بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["tag"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/tagkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Tags Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل المعرفات بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["tag"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/tagsilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Tags Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل المعرفات بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["tag"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/tagok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["tag"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Tags Posting Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل المعرفات غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'This Group Now Allow Tags Posting'
   elseif lang then
			text = 'تم الغاء قفل المعرفات 🔓'
    end
			data[tostring(matches[2])]["settings"]["tag"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
		  --#######Mention Settings#######--
if matches[1] == '/mentionwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Mention Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل المنشن بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["mention"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mentiondel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Mention Status Changed To : Del'
   elseif lang then
			text = 'تم قفل المنشن بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["mention"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mentionkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Mention Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل المنشن بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["mention"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mentionsilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Mention Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل المنشن بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["mention"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/mentionok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["mention"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Mention Message Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل المنشن غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'This Group Now Allow Mention Message'
   elseif lang then
			text = 'تم الغاء قفل المنشن 🔓'
    end
			data[tostring(matches[2])]["settings"]["mention"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
		  --#######Arabic Settings#######--
if matches[1] == '/arabicwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Arabic Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل العربية بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["arabic"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/arabicdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Arabic Status Changed To : Del'
   elseif lang then
			text = 'تم قفل العربية بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["arabic"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/arabickick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Arabic Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل العربية بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["arabic"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/arabicsilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Arabic Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل العربية بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["arabic"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/arabicok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["arabic"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Arabic Message Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل العربية غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'This Group Now Allow Arabic Message'
   elseif lang then
			text = 'تم الغاء قفل العربية 🔓'
    end
			data[tostring(matches[2])]["settings"]["arabic"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
		  --#######Webpage Settings#######--
if matches[1] == '/webwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Webpage Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل روابط المواقع بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["webpage"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/webdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Webpage Status Changed To : Del'
   elseif lang then
			text = 'تم قفل روابط المواقع بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["webpage"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/webkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Webpage Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل روابط المواقع بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["webpage"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/websilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Webpage Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل روابط المواقع بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["webpage"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/webok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["webpage"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Webpage Posting Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل روابط المواقع غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'This Group Now Allow Webpage Posting'
   elseif lang then
			text = 'تم الغاء قفل روابط المواقع 🔓'
    end
			data[tostring(matches[2])]["settings"]["webpage"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
		  --#######Markdown Settings#######--
if matches[1] == '/markwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Markdown Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل الماركداون بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["markdown"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/markdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Markdown Status Changed To : Del'
   elseif lang then
			text = 'تم قفل الماركداون بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["markdown"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/markkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Markdown Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل الماركداون بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["markdown"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/marksilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Markdown Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل الماركداون بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["markdown"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting(msg, data, matches[2])
	end
end
if matches[1] == '/markok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["markdown"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Markdown Message Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل الماركداون غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'This Group Now Allow Markdown Message'
   elseif lang then
			text = 'تم الغاء قفل الماركداون 🔓'
    end
			data[tostring(matches[2])]["settings"]["markdown"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
		  --#######Forward Settings#######--
if matches[1] == '/fwdwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Forward Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل اعادة التوجيه بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["forward"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/fwddel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Forward Status Changed To : Del'
   elseif lang then
			text = 'تم قفل اعادة التوجيه بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["forward"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/fwdkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Forward Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل اعادة التوجيه بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["forward"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/fwdsilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Forward Status Changed To : Bab'
   elseif lang then
			text = 'تم قفل اعادة التوجيه بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["forward"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/fwdok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["forward"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Forwarding Message Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل اعادة التوجيه غيل مفعل 🔓'
    end
		else
   if not lang then
			text = 'This Group Now Allow Forwarding Message'
   elseif lang then
			text = 'تم الغاء قفل اعادة التوجيه 🔓'
    end
			data[tostring(matches[2])]["settings"]["forward"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
		  --#######Sticker Settings#######--
if matches[1] == '/stickerwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Sticker Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل الملصقات بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["sticker"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/stickerdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Sticker Status Changed To : Del'
   elseif lang then
			text = 'تم قفل الملصقات بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["sticker"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/stickerkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Sticker Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل الملصقات بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["sticker"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/stickersilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Sticker Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل الملصقات بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["sticker"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/stickerok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["sticker"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Sticker Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل الملصقات غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'Sticker Restriction Has Been Disabled'
   elseif lang then
			text = 'تم الغاء قفل الملصقات 🔓'
    end
			data[tostring(matches[2])]["settings"]["sticker"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
		  --#######Video Settings#######--
if matches[1] == '/videowarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Video Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل الفيديو بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["video"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/videodel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Video Status Changed To : Del'
   elseif lang then
			text = 'تم قفل الفيديو بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["video"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/videokick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Video Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل الفيديو بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["video"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/videosilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Video Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل الفيديو بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["video"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/videook' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["video"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Video Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل الفيديو غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'Video Restriction Has Been Disabled'
   elseif lang then
			text = 'تم الغاء قفل الفيديو 🔓'
    end
			data[tostring(matches[2])]["settings"]["video"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
		  --#######Audio Settings#######--
if matches[1] == '/audiowarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Audio Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل الصوتيات بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["audio"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/audiodel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Audio Status Changed To : Del'
   elseif lang then
			text = 'تم قفل الصوتيات بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["audio"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/audiokick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Audio Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل الصوتيات بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["audio"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/audiosilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Audio Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل الصوتيات بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["audio"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/audiook' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["audio"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Audio Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل الصوتيات غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'Audio Restriction Has Been Disabled'
   elseif lang then
			text = 'تم الغاء قفل الصوتيات 🔓'
    end
			data[tostring(matches[2])]["settings"]["audio"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
		  --#######Voice Settings#######--
if matches[1] == '/voicewarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Voice Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل التسجيلات بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["voice"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/voicedel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Voice Status Changed To : Del'
   elseif lang then
			text = 'تم قفل التسجيلات بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["voice"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/voicekick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Voice Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل التسجيلات بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["voice"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/voicesilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Voice Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل التسجيلات بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["voice"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/voiceok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["voice"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Voice Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل التسجيلات غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'Voice Restriction Has Been Disabled'
   elseif lang then
			text = 'تم الغاء قفل التسجيلات 🔓'
    end
			data[tostring(matches[2])]["settings"]["voice"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
		  --#######Photo Settings#######--
if matches[1] == '/photowarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Photo Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل الصور بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["photo"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/photodel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Photo Status Changed To : Del'
   elseif lang then
			text = 'تم قفل الصور بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["photo"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/photokick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Photo Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل الصور بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["photo"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/photosilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Photo Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل الصور بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["photo"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
if matches[1] == '/photook' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["photo"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Photo Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل الصور غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'Photo Restriction Has Been Disabled'
   elseif lang then
			text = 'تم الغاء قفل الصور 🔓'
    end
			data[tostring(matches[2])]["settings"]["photo"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting1(msg, data, matches[2])
	end
end
		  --#######Document Settings#######--
if matches[1] == '/docwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Document Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل الملفات بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["document"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/docdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Document Status Changed To : Del'
   elseif lang then
			text = 'تم قفل الملفات بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["document"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/dockick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Document Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل الملفات بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["document"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/docsilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Document Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل الملفات بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["document"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/docok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["document"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Document Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل الملفات غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'Document Restriction Has Been Disabled'
   elseif lang then
			text = 'تم الغاء قفل الملفات 🔓'
    end
			data[tostring(matches[2])]["settings"]["document"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
		  --#######Location Settings#######--
if matches[1] == '/locwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Location Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل مشاركة الموقع بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["location"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/locdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Location Status Changed To : Del'
   elseif lang then
			text = 'تم قفل مشاركة الموقع بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["location"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/lockick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Location Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل مشاركة الموقع بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["location"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/locsilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Location Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل مشاركة الموقع بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["location"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/locok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["location"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Location Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل مشاركة الموقع غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'Location Restriction Has Been Disabled'
   elseif lang then
			text = 'تم الغاء قفل مشاركة الموقع 🔓'
    end
			data[tostring(matches[2])]["settings"]["location"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
		  --#######Gif Settings#######--
if matches[1] == '/gifwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Gif Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل صور المتحركة بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["gif"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/gifdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Gif Status Changed To : Del'
   elseif lang then
			text = 'تم قفل صور المتحركة بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["gif"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/gifkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Gif Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل صور المتحركة بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["gif"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/gifsilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Gif Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل صور المتحركة بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["gif"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/gifok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["gif"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Gif Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل صور المتحركة غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'Gif Restriction Has Been Disabled'
   elseif lang then
			text = 'تم الغاء قفل صور المتحركة 🔓'
    end
			data[tostring(matches[2])]["settings"]["gif"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
		  --#######Chat Settings#######--
if matches[1] == '/chatwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Chatting Status Changed To : Warn'
   elseif lang then
			text = 'تم تفعيل الصامت للمجموعة بالتحذير 🔕'
    end
			data[tostring(matches[2])]["settings"]["chat"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/chatdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Chatting Status Changed To : Del'
   elseif lang then
			text = 'تم تفعيل الصامت للمجموعة بالحذف 🔕'
    end
			data[tostring(matches[2])]["settings"]["chat"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/chatkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Chatting Status Changed To : Kick'
   elseif lang then
			text = 'تم تفعيل الصامت للمجموعة بالطرد 🔕'
    end
			data[tostring(matches[2])]["settings"]["chat"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/chatsilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Chatting Status Changed To : Ban'
   elseif lang then
			text = 'تم تفعيل الصامت للمجموعة بالتصميت 🔕'
    end
			data[tostring(matches[2])]["settings"]["chat"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/chatok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["chat"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Chatting Restriction Is Not Enabled'
   elseif lang then
			text = 'الصامت للمجموعة غير مفعل 🔔'
    end
		else
   if not lang then
			text = 'Chatting Restriction Has Been Disabled'
   elseif lang then
			text = 'تم الغاء الصامت للمجموعة 🔔'
    end
			data[tostring(matches[2])]["settings"]["chat"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
		  --#######View Settings#######--
if matches[1] == '/viewwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Forward From Channel Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل توجيه القنوات بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["view"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/viewdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Forward From Channel Status Changed To : Del'
   elseif lang then
			text = 'تم قفل توجيه القنوات بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["view"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/viewkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Forward From Channel Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل توجيه القنوات بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["view"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/viewsilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Forward From Channel Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل توجيه القنوات بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["view"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/viewok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["view"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Forward From Channel Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل توجيه القنوات غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'Forward From Channel Restriction Has Been Disabled'
   elseif lang then
			text = 'تم الغاء قفل توجيه القنوات 🔓'
    end
			data[tostring(matches[2])]["settings"]["view"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
		  --#######Contact Settings#######--
if matches[1] == '/contwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Contact Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل جهات اتصال بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["contact"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/contdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Contact Status Changed To : Del'
   elseif lang then
			text = 'تم قفل جهات اتصال بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["contact"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/contkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Contact Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل جهات اتصال بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["contact"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/contsilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Contact Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل جهات اتصال بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["contact"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/contok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["contact"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Contact Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل جهات اتصال غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'Contact Restriction Has Been Disabled'
   elseif lang then
			text = 'تم الغاء قفل جهات اتصال 🔓'
    end
			data[tostring(matches[2])]["settings"]["contact"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
		  --#######Inline Settings#######--
if matches[1] == '/inlinewarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Inline Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل ازرار شفافة بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["inline"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/inlinedel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Inline Status Changed To : Del'
   elseif lang then
			text = 'تم قفل ازرار شفافة بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["inline"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/inlinekick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Inline Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل ازرار شفافة بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["inline"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/inlinesilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Inline Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل ازرار شفافة بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["inline"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
if matches[1] == '/inlineok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["inline"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Inline Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل ازرار شفافة غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'Inline Restriction Has Been Disabled'
   elseif lang then
			text = 'تم الغاء قفل ازرار شفافة 🔓'
    end
			data[tostring(matches[2])]["settings"]["inline"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting2(msg, data, matches[2])
	end
end
		  --#######Keyboard Settings#######--
if matches[1] == '/keywarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Keyboard Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل كيبورد بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["keyboard"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/keydel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Keyboard Status Changed To : Del'
   elseif lang then
			text = 'تم قفل كيبورد بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["keyboard"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/keykick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Keyboard Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل كيبورد بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["keyboard"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/keysilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Keyboard Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل كيبورد بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["keyboard"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/keyok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["keyboard"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Keyboard Restriction Is Not Enabled'
   elseif lang then
			text = 'قفل كيبورد غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'Keyboard Restriction Has Been Disabled'
   elseif lang then
			text = 'تم الغاء قفل كيبورد 🔓'
    end
			data[tostring(matches[2])]["settings"]["keyboard"] = "غير مفعل"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
		  --#######Anti Spam Settings#######--
if matches[1] == '/spamwarn' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Spam Protection Status Changed To : Warn'
   elseif lang then
			text = 'تم قفل السبام بالتحذير 🔐'
    end
			data[tostring(matches[2])]["settings"]["spam"] = "بالتحذير"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/spamdel' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Spam Protection Status Changed To : Del'
   elseif lang then
			text = 'تم قفل السبام بالحذف 🔐'
    end
			data[tostring(matches[2])]["settings"]["spam"] = "بالحذف"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/spamkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Spam Protection Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل السبام بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["spam"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/spamsilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Spam Protection Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل السبام بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["spam"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/spamok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["spam"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Anti Spam Protection Is Not Enabled'
   elseif lang then
			text = 'قفل السبام غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'Anti Spam Protection Has Been Disabled'
   elseif lang then
			text = 'تم الغاء قفل السبام 🔓'
    end
			data[tostring(matches[2])]["settings"]["spam"] = "disable"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
		  --#######Anti Flood Settings#######--
if matches[1] == '/floodkick' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Flood Protection Status Changed To : Kick'
   elseif lang then
			text = 'تم قفل التكرار بالطرد 🔐'
    end
			data[tostring(matches[2])]["settings"]["flood"] = "بالطرد"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/floodsilent' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
   if not lang then
			text = 'Anti Flood Protection Status Changed To : Ban'
   elseif lang then
			text = 'تم قفل التكرار بالتصميت 🔐'
    end
			data[tostring(matches[2])]["settings"]["flood"] = "بالتصميت"
			save_data(_config.moderation.data, data)
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/floodok' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local is_ok = data[tostring(matches[2])]["settings"]["flood"]
		if is_ok == "غير مفعل" then
   if not lang then
			text = 'Anti Flood Protection Is Not Enabled'
   elseif lang then
			text = 'قفل التكرار غير مفعل 🔓'
    end
		else
   if not lang then
			text = 'Anti Flood Protection Has Been Disabled'
   elseif lang then
			text = 'تم الغاء قفل التكرار 🔓'
    end
			data[tostring(matches[2])]["settings"]["flood"] = "disable"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/locktgservice' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local lock_tgservice = data[tostring(matches[2])]["settings"]["lock_tgservice"]
   if not lock_tgservice then
			data[tostring(matches[2])]["settings"]["lock_tgservice"] = "no"
			save_data(_config.moderation.data, data)
		end
		if lock_tgservice == "no" then
   if not lang then
			tgtext = 'TgService Has Been Locked'
   elseif lang then
			tgtext = 'تم تفعيل قفل الاشعارات 🔐'
    end
            data[tostring(matches[2])]["settings"]["lock_tgservice"] = "yes"
			save_data(_config.moderation.data, data)
		elseif lock_tgservice == "yes" then
   if not lang then
			tgtext = 'TgService Has Been Unlocked'
   elseif lang then
			tgtext = 'تم الغاء قفل الاشعارات 🔓'
    end
			data[tostring(matches[2])]["settings"]["lock_tgservice"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, tgtext)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/lockpin' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_pin"]
		if chklock == "no" then
   if not lang then
			text = 'Pin Has Been Locked'
   elseif lang then
			text = 'تم تفعيل قفل التثبيت 🔐'
    end
            data[tostring(matches[2])]["settings"]["lock_pin"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Pin Has Been Unlocked'
   elseif lang then
			text = 'تم الغاء قفل التثبيت 🔓'
    end
			data[tostring(matches[2])]["settings"]["lock_pin"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/lockbots' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["lock_bots"]
		if chklock == "no" then
   if not lang then
			text = 'Bots Has Been Locked'
   elseif lang then
			text = 'تم تفعيل قفل دخول البوتات 🔐'
    end
            data[tostring(matches[2])]["settings"]["lock_bots"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Bots Has Been Unlocked'
   elseif lang then
			text = 'تم الغاء قفل دخول البوتات 🔓'
    end
			data[tostring(matches[2])]["settings"]["lock_bots"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/welcome' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local chklock = data[tostring(matches[2])]["settings"]["welcome"]
		if chklock == "no" then
   if not lang then
			text = 'Welcome Has Been Enabled'
   elseif lang then
			text = 'تم تفعيل الترحيب ✅'
    end
            data[tostring(matches[2])]["settings"]["welcome"] = "yes"
			save_data(_config.moderation.data, data)
		elseif chklock == "yes" then
   if not lang then
			text = 'Welcome Has Been Disabled'
   elseif lang then
			text = 'تم الغاء الترحيب ❎'
    end
			data[tostring(matches[2])]["settings"]["welcome"] = "no"
			save_data(_config.moderation.data, data)
		end
		get_alert(msg.cb_id, text)
		setting3(msg, data, matches[2])
	end
end
if matches[1] == '/floodup' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local flood_max = 10
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['num_msg_max'] then
				flood_max = data[tostring(matches[2])]['settings']['num_msg_max']
			end
		end
		if tonumber(flood_max) < 30 then
			flood_max = tonumber(flood_max) + 1
			data[tostring(matches[2])]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
   if not lang then
			text = "Flood Sensitivity Has Been Set To : "..flood_max
   elseif lang then
			text = "✅ تم تحديد عدد رسائل التكرار الى : "..flood_max
    end
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/flooddown' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local flood_max = 10
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['num_msg_max'] then
				flood_max = data[tostring(matches[2])]['settings']['num_msg_max']
			end
		end
		if tonumber(flood_max) > 2 then
			flood_max = tonumber(flood_max) - 1
			data[tostring(matches[2])]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
   if not lang then
			text = "Flood Sensitivity Has Been Set To : "..flood_max
   elseif lang then
			text = "✅ تم تحديد عدد رسائل التكرار الى : "..flood_max
    end
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/charup' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local char_max = 4000
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['set_char'] then
				char_max = data[tostring(matches[2])]['settings']['set_char']
			end
		end
		if tonumber(char_max) < 1000 then
			char_max = tonumber(char_max) + 1
			data[tostring(matches[2])]['settings']['set_char'] = char_max
			save_data(_config.moderation.data, data)
   if not lang then
			text = "Character Sensitivity Has Been Set To : "..char_max
   elseif lang then
			text = "✅ تم تحديد عدد حروف الرسائل الى : "..char_max
    end
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/chardown' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local char_max = 4000
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['set_char'] then
				char_max = data[tostring(matches[2])]['settings']['set_char']
			end
		end
		if tonumber(char_max) > 2 then
			char_max = tonumber(char_max) - 1
			data[tostring(matches[2])]['settings']['set_char'] = char_max
			save_data(_config.moderation.data, data)
   if not lang then
			text = "Character Sensitivity Has Been Set To : "..char_max
   elseif lang then
			text = "✅ تم تحديد عدد حروف الرسائل الى : "..char_max
    end
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/floodtimeup' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local check_time = 2
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['time_check'] then
				check_time = data[tostring(matches[2])]['settings']['time_check']
			end
		end
		if tonumber(check_time) < 10 then
			check_time = tonumber(check_time) + 1
			data[tostring(matches[2])]['settings']['time_check'] = check_time
			save_data(_config.moderation.data, data)
   if not lang then
			text = "Flood Check Time Has Been Set To : "..check_time
   elseif lang then
			text = "✅ تم تحديد زمن التكرار الى : "..check_time
    end
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end
if matches[1] == '/floodtimedown' then
	if not is_mod1(matches[2], msg.from.id) then
     if not lang then
		get_alert(msg.cb_id, "You Are Not Moderator")
   elseif lang then
		get_alert(msg.cb_id, "للمشرفين فقط ⛔️")
   end
	else
		local check_time = 2
        if data[tostring(matches[2])] then
			if data[tostring(matches[2])]['settings']['time_check'] then
				check_time = data[tostring(matches[2])]['settings']['time_check']
			end
		end
		if tonumber(check_time) > 2 then
			check_time = tonumber(check_time) - 1
			data[tostring(matches[2])]['settings']['time_check'] = check_time
			save_data(_config.moderation.data, data)
   if not lang then
			text = "Flood Check Time Has Been Set To : "..check_time
   elseif lang then
			text = "✅ تم تحديد زمن التكرار الى : "..check_time
    end
			get_alert(msg.cb_id, text)
		end 
		moresetting(msg, data, matches[2])
	end
end


            -- ####################### More #######################--
			
if matches[1] == '/more' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		local text = '*More Option*\n\n`المزيد من الاعدادات`'
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🗣 المدراء", callback_data="/ownerlist:"..matches[2]},
				{text = "👤 الادمن", callback_data="/modlist:"..matches[2]}
			},
			{
				{text = "🔇 المصمتين", callback_data="/silentlist:"..matches[2]},
				{text = "🚯 كلمات المحظورة", callback_data="/filterlist:"..matches[2]}
			},
			{
				{text = "⛔️ المحظورين", callback_data="/bans:"..matches[2]},
				{text = "🖱 قائمة بيضاء", callback_data="/whitelist:"..matches[2]}
			},
			{
				{text = "📎 رابط مجموعة", callback_data="/link:"..matches[2]},
				{text = "📋 قوانين المجموعة", callback_data="/rules:"..matches[2]}
			},
			{ 
			{text = "🎊 رسالة الترحيب ", callback_data="/showwlc:"..matches[2]},
			},
			{ 
				{text = "🔚 العودة", callback_data="/option:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/ownerlist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		local i = 1
		if next(data[tostring(matches[2])]['owners']) == nil then --fix way
			text = "`قائمة المدراء فارغة`"
		else
			text = '`🗣 قائمة المدراء للمجموعة :`\n'
			for k,v in pairs(data[tostring(matches[2])]['owners']) do
				text = text ..i.. '- '..v..' [' ..k.. '] \n'
				i = i + 1
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🗑 تنظيف جميع المدراء ", callback_data="/cleanowners:"..matches[2]}
			},
			{ 
				{text = "🔚 العودة", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/cleanowners' then
	if not is_sudo(msg) then
		get_alert(msg.cb_id, "للمطورين البوت فقط")
	else
		if next(data[tostring(matches[2])]['owners']) == nil then
			text = "`قائمة المدراء فارغة`"
		else
			text = "`تم تنظيف قائمة المدراء` ✅"
			for k,v in pairs(data[tostring(matches[2])]['owners']) do
				data[tostring(matches[2])]['owners'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🔚 العودة", callback_data="/ownerlist:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/filterlist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		if next(data[tostring(matches[2])]['filterlist']) == nil then --fix way
			text = "`قائمة الكلمات المحظورة فارغة`"
		else 
			local i = 1
			text = '`قائمة الكلمات المحظورة :`\n'
			for k,v in pairs(data[tostring(matches[2])]['filterlist']) do
				text = text..''..i..' - '..check_markdown(k)..'\n'
				i = i + 1
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🗑 تنظيف كلمات المحظورة ", callback_data="/cleanfilterlist:"..matches[2]}
			},
			{ 
				{text = "🔚 العودة", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/cleanfilterlist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		if next(data[tostring(matches[2])]['filterlist']) == nil then
			text = "`قائمة الكلمات المحظورة فارغة`"
		else
			text = "`تم تنظيف قائمة كلمات المحظورة` ✅"
			for k,v in pairs(data[tostring(matches[2])]['filterlist']) do
				data[tostring(matches[2])]['filterlist'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🔚 العودة", callback_data="/filterlist:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/modlist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		local i = 1
		if next(data[tostring(matches[2])]['mods']) == nil then --fix way
			text = "`قائمة الادمن فارغة`"
		else
			text = '👤 `قائمة الادمن في المجموعة :`\n'
			for k,v in pairs(data[tostring(matches[2])]['mods']) do
				text = text ..i.. '- '..v..' [' ..k.. '] \n'
				i = i + 1
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🗑 تنظيف جميع الادمن ", callback_data="/cleanmods:"..matches[2]}
			},
			{ 
				{text = "🔚 العودة", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/cleanmods' then
	if not is_owner1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء في البوت فقط ⛔️")
	else
		if next(data[tostring(matches[2])]['mods']) == nil then
			text = "`قائمة الادمن فارغة`"
		else
			text = "`تم تنظيف قائمة الادمن` ✅"
			for k,v in pairs(data[tostring(matches[2])]['mods']) do
				data[tostring(matches[2])]['mods'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🔚 العودة", callback_data="/modlist:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/bans' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		local i = 1
		if next(data[tostring(matches[2])]['banned']) == nil then --fix way
			text = "`قائمة المحظورين فارغة`"
		else
			text = '⛔️ `قائمة اعضاء المحظورين :`\n'
			for k,v in pairs(data[tostring(matches[2])]['banned']) do
				text = text ..i.. '- '..v..' [' ..k.. '] \n'
				i = i + 1
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🗑 تنظيف جميع المحظورين ", callback_data="/cleanbans:"..matches[2]}
			},
			{ 
				{text = "🔚 العودة", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/whitelist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
      if not data[tostring(matches[2])]['whitelist'] then
    data[tostring(matches[2])]['whitelist'] = {}
    save_data(_config.moderation.data, data)
		elseif next(data[tostring(matches[2])]['whitelist']) == nil then --fix way
			text = "_لا يوجد اعضاء في قائمة البيضاء_"
		else 
			local i = 1
			text = '*اعضاء في القائمة البيضاء :*\n'
			for k,v in pairs(data[tostring(matches[2])]['whitelist']) do
				text = text ..i.. '- '..v..' [' ..k.. '] \n'
				i = i + 1
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🗑 تنظيف القائمة ", callback_data="/cleanwhitelist:"..matches[2]}
			},
			{ 
				{text = "🔚 العودة", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/cleanwhitelist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		if next(data[tostring(matches[2])]['whitelist']) == nil then
			text = "_لا يوجد اعضاء في قائمة البيضاء_"
		else
			text = "`تم تنظيف قائمة البيضاء` ✅"
			for k,v in pairs(data[tostring(matches[2])]['whitelist']) do
				data[tostring(matches[2])]['whitelist'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🔚 العودة", callback_data="/whitelist:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/silentlist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		local i = 1
		if next(data[tostring(matches[2])]['is_silent_users']) == nil then --fix way
			text = "`قائمة المصمتين فارغة`"
		else
			text = '`قائمة اعضاء المصمتين :`\n'
			for k,v in pairs(data[tostring(matches[2])]['is_silent_users']) do
				text = text ..i.. '- '..v..' [' ..k.. '] \n'
				i = i + 1
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🗑 تنظيف القائمة المصمتين ", callback_data="/cleansilentlist:"..matches[2]}
			},
			{ 
				{text = "🔚 العودة", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/cleansilentlist' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		if next(data[tostring(matches[2])]['is_silent_users']) == nil then
			text = "`قائمة المصمتين فارغة`"
		else
			text = "`تم تنظيف قائمة المصمتين` ✅"
			for k,v in pairs(data[tostring(matches[2])]['is_silent_users']) do
				data[tostring(matches[2])]['is_silent_users'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🔚 العودة", callback_data="/silentlist:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/cleanbans' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		if next(data[tostring(matches[2])]['banned']) == nil then
			text = "`قائمة المحظورين فارغة`"
		else
			text = "`تم تنظيف قائمة المحظورين` ✅"
			for k,v in pairs(data[tostring(matches[2])]['banned']) do
				data[tostring(matches[2])]['banned'][tostring(k)] = nil
				save_data(_config.moderation.data, data)
			end
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🔚 العودة", callback_data="/bans:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/link' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		local linkgp = data[tostring(matches[2])]['settings']['linkgp']
		if not linkgp then
			text = "` ارسل اولا الامر ادناه لحفظ الرابط`\n\n_تعيين رابط_"
		else
			text = "[📎 رابط المجموعة اضغط هنا]("..linkgp..")"
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🔚 العودة", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/rules' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		local rules = data[tostring(matches[2])]['rules']
		if not rules then
			text = "_ℹ️ القوانين التلقائية :\n1⃣ ممنوع الاعلانات \n2⃣ ممنوع السبام. \n3⃣ تبلیغ ممنوع.\n4⃣ ممنوع الملصقات.\n5⃣ ممنوع الصور المتحركة.\n➡️ اي عضو يخالف القوانين يستم حظره._\n@alameen79"
		elseif rules then
			text = '`قوانين المجموعة :`\n'..rules
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🗑 تنظيف القوانين ", callback_data="/cleanrules:"..matches[2]}
			},
			{ 
				{text = "🔚 العودة", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/cleanrules' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		local rules = data[tostring(matches[2])]['rules']
		if not rules then
			text = "`لا توجد قوانين حاليا`"
		else
			text = "`تم تنظيف القوانين` ✅"
			data[tostring(matches[2])]['rules'] = nil
			save_data(_config.moderation.data, data)
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🔚 العودة", callback_data="/rules:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/showwlc' then
local text = ''
if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		local wlc = data[tostring(matches[2])]['setwelcome']
		if not wlc then
				text = '`لا توجد رسالة ترحيب مخصصة`\n_رسالة الترحيب التلقائية هي :\n\n_ _👋 مرحبا  نورت(ي) في المجموعة _\n\n`⛔️ التزم بقوانين المجموعة`'
		else
			text = '`رسالة الترحيب الحالية :`\n\n'..wlc
		end
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🗑 تنظيف الترحيب ", callback_data="/cleanwlcmsg:"..matches[2]}
			},
			{ 
				{text = "🔚 العودة", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/cleanwlcmsg' then
local text = ''
if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
local wlc = data[tostring(matches[2])]['setwelcome']
		if not wlc then
				text = "`لا توجد رسالة ترحيب مخصصة`"
			else
			text = 'تم تنظيف رسالة الترحيب ✅'
		data[tostring(matches[2])]['setwelcome'] = nil
		save_data(_config.moderation.data, data)
end
  keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🔚 العودة", callback_data="/more:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

--####################### Help #######################
			
if matches[1] == '/help' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		local text = [[📋 *AdamBot*

📋 _اوامر ستيف بوت_
]]
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🔐 اوامر القفل", callback_data="/lock:"..matches[2]},
				{text = "☑️ اوامر العامة", callback_data="/all:"..matches[2]}
			},
			{
				{text = "🔕 اوامر الصامت", callback_data="/slt:"..matches[2]},
				{text = "🗣 اوامر الردود", callback_data="/rep:"..matches[2]}
			},
			{
				{text = "🔘 اوامر اضافية", callback_data="/other:"..matches[2]},
			{text = "👤 اوامر المطور", callback_data="/dev:"..matches[2]}
			},
			{ 
				{text = "✖️ الخروج", callback_data="/exit:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/lock' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		local text = [[📋 *AdamBot*

📋 _اوامر ستيف بوت بالحذف و التحذير و تصميت و الطرد_
]]
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = " ⚠️  قفل بالتحذير ", callback_data="/thd:"..matches[2]},
				{text = " 🗑 قفل بالحذف ", callback_data="/dl:"..matches[2]}
			},
			{
				{text = " 🔇 قفل بالتصميت ", callback_data="/smt:"..matches[2]},
				{text = " ⛔️ قفل بالطرد ", callback_data="/trd:"..matches[2]}
			},
			{
				{text = "🔚 العودة", callback_data="/help:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/all' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		text = [[
`📋 اوامر AdamBot :`

`● اوامر العامة ● `
            
`👤 رفع مدير`
_رفع مدير في المجموعة_
`👤 حذف مدير` 
_حذف مدير من المجموعة_
`👤 رفع ادمن` 
_رفع ادمن في المجموعة_
`👤 حذف ادمن`
_حذف ادمن من المجموعة_
            
_🚸 ملاحظة : جميع اوامر الترقية تعمل بالرد والمعرف والايدي 🚸_ 
            
`● اوامر الطرد والحماية ● `
            
`⛔️ تحديد التكرار [عدد]`
_تحديد التكرار هجوم بين 5 و 50_
`⛔️ تحديد وقت التكرار [عدد]`
_تحديد وقت بين رسائل تكرار_
`⛔️ الحد الاقصى للحروف [عدد]`
_تحديد عدد حروف رسائل_
`⛔️ تصميت`
_تفعيل وضع الصامت لعضو_
`⛔️ الغاء تصميت` 
_ازالة العضو من قائمة المصمتين_
`⛔️ طرد` 
_طرد عضو من المجموعة_
`⛔️ حظر` 
_حظر عضو من المجموعة_
`⛔️ الغاء الحظر` 
_ازالة حظر عن عضو_

_🚸 ملاحظة : جميع اوامر الطرد والحماية تعمل بالرد والمعرف والايدي 🚸_     
            
`● اوامر المعلومات ● `
            
*ℹ️ من هو* `[المعرف]`
_معرفة معلومات العضو بالمعرف_
*ℹ️ ايدي* `[reply]`
_معلومات العضو بالرد_
*ℹ️ العضو* `[الايدي]`
_معرف العضو بالايدي_
*ℹ️ معلومات المجموعة*
_عرض معلومات المجموعة_
*ℹ️ معلومات بالرد | المعرف*
_عرض معلوماتي او اعضاء_
*ℹ️ ايدي*
_عرض معلوماتي مرفقة بصورة_

`● صامت للمجموعة ● `
          
`🔕 قفل مجموعة`
_وضع صامت للمجموعة_ 
`🔔 فتح مجموعة`
_فتح صامت للمجموعة_ 

`🔕 اوامر الصامت`
_للعرض جميع اوامر الصامت_

`● اوامر التعيين والتنظيف ● `
         
`📋 تعيين [قوانين | اسم | رابط | وصف | ترحيب]`
            
_البوت سيقوم بتعيينهم_
            
`📋 تنظيف [المحظورين | الادمن | القوانين | الوصف | قائمة المصمتين | قائمة فلتر | الترحيب]  `

_البوت سيقوم بحذفهم_

`⛔️ طرد البوتات`
_طرد البوتات في المجموعة_

`🗑 تنظيف المطرودين`
_تنظيف قائمة المطرودين من مجموعة_

`🗑 تنظيف حسابات المحذوفة`
_مسح حسابات محذوفة من قروب_

`● اوامر اخرى ●`

 `📌 فلتر [كلمة]`
_حظر كلمة_
 `📌 حذف فلتر [كلمة]`
_ازالة الحظر عن كلمة_
`📌 تثبيت [بالرد]`
_تثبيت رسالة_
`📌 الغاء التثبيت` 
_ازالة تثبيت رسالة_
`📌 الترحيب فعال/تعطيل`
_تفعيل وتعطيل الترحيب_
`📌 القائمة البيضاء [+ | -]`	
_اضافة او ازالة مستخدم للقائمة البيضاء_

`● اوامر الترحيب ● `

`🎉️ الترحيب تفعيل | تعطيل`
_للتشغيل او تعطيل الترحيب_
`🎉️ تعيين ترحيب`
_تخصيص ترحيب للمجموعة_

`● اوامر القوائم ● `
            
`🗒 قائمة المصمتين`
_عرض قائمة الاعضاء المصمتين_
`🗒 قائمة فلتر`
_عرض قائمة الكلمات المحظورة_
`🗒 قائمة المحظورين`
_عرض قائمة المحظورين_
`🗒 قائمة المدراء`
_عرض قائمة المدراء_
`🗒 القائمة البيضاء`
_عرض الاعضاء في القائمة البيضاء_
`🗒 قائمة الادمن` 
_عرض قائمة الادمن_
            
`● اوامر اضافية ● `

*📍 القوانين*
_عرض قوانين المجموعة_
*📍 الوصف*
_عرض وصف المجموعة_

`● اوامر الروابط ● `
            
`🔗 تعيين رابط`
_حفظ رابط جديد_
`🔗 الرابط`
_عرض رابط المجموعة_
`🔗 الرابط خاص`
_ارسال الرابط خاص_

`● اوامر عامة ● `

`🔧 الاوامر [المدراء | الاعضاء | المشرفين]`	
_تحديد من يستخدم الاوامر_
`🔧 الاعدادات`
_عرض اعدادات المجموعة_
`🔧 اعدادات قفل`
_عرض اعدادات القفل_
`🔧 لغة [انجليزي | عربي]`
_تحويل اللغة للانجليزية لو العربية_
`🔧 اوامر انجليزي`
_تحويل اوامر للانجليزي_

`🚮 مسح` *1000*
_تنظيف رسائل المجموعة بالعدد_

`🚮 تنظيف المجموعة`
_تنظيف 5000 رسالة من المجموعة_

`🔰 تحقق`
_تحقق من ايام تفعيل_
`👤 بروفايل [ ايدي عضو ]`
_للعرض صور بروفايل العضو_
`🌀 منشن [ ايدي عضو ]`
_للعمل منشن للعضو و دخول له_
`✉️ رسالة للمطور [رسالة]`
_ارسال رسالة للمطور_
ا➖➖➖➖➖➖➖➖➖➖➖
[📡 جديدنا](https://t.me/joinchat/AAAAAEGk9JrUPUWj9fgIkg)
            ]]
		keyboard = {} 
		keyboard.inline_keyboard = {
			{ 
				{text = "🔚 العودة", callback_data="/help:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/dev' then
	if not is_sudo(msg) then
		get_alert(msg.cb_id, "للمطورين البوت فقط")
	else
		text = [[

_اوامر المطورين_

`✅ تفعيل` 
_تفعيل البوت في المجموعة_

`❎ تعطيل`
_تعطيل البوت في مجموعة_

`💠 تعطيل [ايدي مجموعة]`
_تعطيل البوت في مجموعة_

`📄 قائمة المطورين`
_عرض المطورين_

`🆔 ايدي مجموعة`
_عرض ايدي المجموعة_

`⤵️ اضافتي الى [ايدي مجموعة]`
_اضافة المطور للمجموعات_

`✔️ رفع مطور`
_رفع مطور في البوت_

`✖️ حذف مطور`
_للحذف مطور من البوت_

`✅ رفع ادمن`
_للرفع ادمن في البوت_

`❎ حذف ادمن`
_للحذف ادمن من البوت_

`📛 حذف معرف بوت`
_حذف معرف البوت بامر_

`🗯 تغيير معرف بوت [معرف]`
_تغيير معرف البوت_

`♦️ تغيير اسم بوت [اسم]`
_تغيير اسم البوت_

`🔊 ارسال للمجموعات`
_ارسال رسالة للمجموعات_

`📈 قائمة المجموعات`
_عرض مجموعات البوت_

`❌ خروج البوت`
_اخراج البوت من المجموعة_

`🚫 طرد البوت [ايدي مجموعة]`
_طرد البوت عن بعد_

`📜 قائمة ادمن`
_قائمة الادمن للبوت_

`🔮 شحن [ايدي مجموعة] [عدد]`
_شحن ايام تفعيل عن بعد_

`⌛️ شحن [عدد ايام]`
_شحن ايام تفعيل في مجموعة_

`🔰 تحقق`
_تحقق من ايام تفعيل عن بعد_

`🆔 تحقق [ايدي مجموعة]`
_تحقق من ايام تفعيل عن بعد_

`📋 ارسال [النص] [ايدي مجموعة]`
_ارسال رسالة للمجموعة معينة_

`📌 اضافتي [ايدي مجموعة]`
_اضافة المطور للمجموعة_

`📎 اضافة البوت [الرابط]`
_اضافة البوت على الرابط_
ا➖➖➖➖➖➖➖➖➖➖➖
[📡 جديدنا](https://t.me/joinchat/AAAAAEGk9JrUPUWj9fgIkg)
            
            ]]
		keyboard = {} 
		keyboard.inline_keyboard = {
			{ 
				{text = "🔚 العودة", callback_data="/help:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end

if matches[1] == '/thd' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		text = [[
_📋 اوامر قفل_ *StePhbot* _بالتحذير ⚠️_

🔐 `قفل الروابط بالتحذير`
🔓 _قفل الروابط تعطيل_

🔐 `قفل المعرفات بالتحذير`
🔓 _قفل المعرفات تعطيل_

🔐 `قفل روابط المواقع بالتحذير`
🔓 _قفل روابط المواقع تعطيل_

🔐 `قفل السبام بالتحذير`
🔓 _قفل السبام تعطيل_

🔐 `قفل التكرار بالتحذير`
🔓 _قفل التكرار تعطيل_

🔐 `قفل الماركداون بالتحذير`
🔓 _قفل الماركداون تعطيل_

🔐 `قفل المنشن بالتحذير`
🔓 _قفل المنشن تعطيل_

🔐 `قفل العربية بالتحذير`
🔓 _قفل العربية تعطيل_

🔐 `قفل اعادة التوجيه بالتحذير`
🔓 _قفل اعادة التوجيه تعطيل_

🔐 `قفل توجيه القنوات بالتحذير`
🔓 _قفل توجيه القنوات تعطيل_

🔐 `قفل التسجيلات بالتحذير`
🔓 _قفل التسجيلات تعطيل_

🔐 `قفل صور المتحركة بالتحذير`
🔓 _قفل صور المتحركة تعطيل_

🔐 `قفل الصوتيات بالتحذير`
🔓 _قفل الصوتيات تعطيل_

🔐 `قفل الفيديو بالتحذير`
🔓 _قفل الفيديو تعطيل_

🔐 `قفل المجموعة بالتحذير`
🔓 _قفل المجموعة تعطيل_

🔐 `قفل الصور بالتحذير`
🔓 _قفل الصور تعطيل_

🔐 `قفل ازرار شفافة بالتحذير`
🔓 _قفل ازرار شفافة تعطيل_

🔐 `قفل كيبورد بالتحذير`
🔓 _قفل كيبورد تعطيل_

🔐 `قفل جهات اتصال بالتحذير`
🔓 _قفل جهات اتصال تعطيل_

🔐 `قفل الملفات بالتحذير`
🔓 _قفل الملفات تعطيل_

🔐 `قفل مشاركة الموقع بالتحذير`
🔓 _قفل مشاركة الموقع تعطيل_

🔐 `قفل النصوص بالتحذير`
🔓 _قفل النصوص تعطيل_

🔐 `قفل التعديل بالتحذير`
🔓 _قفل التعديل تعطيل_

🔐 `قفل الملصقات بالتحذير`
🔓 _قفل الملصقات تعطيل_

ℹ️ هذه اوامر لا تحتاج تحذير ⬇️

🔐 `قفل دخول البوتات`
🔓_ فتح دخول البوتات_
🔐 `قفل دخول الاعضاء`
🔓 _فتح دخول الاعضاء_
🔐 `قفل الاشعارات`
🔓 _فتح الاشعارات_
🔐 `قفل التثبيت`
🔓 _فتح التثبيت_
ا➖➖➖➖➖➖➖➖➖➖➖
[📡 جديدنا](https://t.me/joinchat/AAAAAEGk9JrUPUWj9fgIkg)
]]
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🔚 العودة", callback_data="/lock:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/trd' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		text = [[
_📋 اوامر قفل_ *StePhbot* _بالطرد ⛔_

🔐 `قفل الروابط بالطرد`
🔓 _قفل الروابط تعطيل_

🔐 `قفل المعرفات بالطرد`
🔓 _قفل المعرفات تعطيل_

🔐 `قفل روابط المواقع بالطرد`
🔓 _قفل روابط المواقع تعطيل_

🔐 `قفل السبام بالطرد`
🔓 _قفل السبام تعطيل_

🔐 `قفل التكرار بالطرد`
🔓 _قفل التكرار تعطيل_

🔐 `قفل الماركداون بالطرد`
🔓 _قفل الماركداون تعطيل_

🔐 `قفل المنشن بالطرد`
🔓 _قفل المنشن تعطيل_

🔐 `قفل العربية بالطرد`
🔓 _قفل العربية تعطيل_

🔐 `قفل اعادة التوجيه بالطرد`
🔓 _قفل اعادة التوجيه تعطيل_

🔐 `قفل توجيه القنوات بالطرد`
🔓 _قفل توجيه القنوات تعطيل_

🔐 `قفل التسجيلات بالطرد`
🔓 _قفل التسجيلات تعطيل_

🔐 `قفل صور المتحركة بالطرد`
🔓 _قفل صور المتحركة تعطيل_

🔐 `قفل الصوتيات بالطرد`
🔓 _قفل الصوتيات تعطيل_

🔐 `قفل الفيديو بالطرد`
🔓 _قفل الفيديو تعطيل_

🔐 `قفل المجموعة بالطرد`
🔓 _قفل المجموعة تعطيل_

🔐 `قفل الصور بالطرد`
🔓 _قفل الصور تعطيل_

🔐 `قفل ازرار شفافة بالطرد`
🔓 _قفل ازرار شفافة تعطيل_

🔐 `قفل كيبورد بالطرد`
🔓 _قفل كيبورد تعطيل_

🔐 `قفل جهات اتصال بالطرد`
🔓 _قفل جهات اتصال تعطيل_

🔐 `قفل الملفات بالطرد`
🔓 _قفل الملفات تعطيل_

🔐 `قفل مشاركة الموقع بالطرد`
🔓 _قفل مشاركة الموقع تعطيل_

🔐 `قفل النصوص بالطرد`
🔓 _قفل النصوص تعطيل_

🔐 `قفل التعديل بالطرد`
🔓 _قفل التعديل تعطيل_

🔐 `قفل الملصقات بالطرد`
🔓 _قفل الملصقات تعطيل_

ℹ️ هذه اوامر لا تحتاج الطرد ⬇️

🔐 `قفل دخول البوتات`
🔓_ فتح دخول البوتات_
🔐 `قفل دخول الاعضاء`
🔓 _فتح دخول الاعضاء_
🔐 `قفل الاشعارات`
🔓 _فتح الاشعارات_
🔐 `قفل التثبيت`
🔓 _فتح التثبيت_
ا➖➖➖➖➖➖➖➖➖➖➖
[📡 جديدنا](https://t.me/joinchat/AAAAAEGk9JrUPUWj9fgIkg)
]]
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🔚 العودة", callback_data="/lock:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/smt' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		text = [[

_📋 اوامر قفل_ *StePhbot* _بالتصميت 🔇_

🔐 `قفل الروابط بالتصميت`
🔓 _قفل الروابط تعطيل_

🔐 `قفل المعرفات بالتصميت`
🔓 _قفل المعرفات تعطيل_

🔐 `قفل روابط المواقع بالتصميت`
🔓 _قفل روابط المواقع تعطيل_

🔐 `قفل السبام بالتصميت`
🔓 _قفل السبام تعطيل_

🔐 `قفل التكرار بالتصميت`
🔓 _قفل التكرار تعطيل_

🔐 `قفل الماركداون بالتصميت`
🔓 _قفل الماركداون تعطيل_

🔐 `قفل المنشن بالتصميت`
🔓 _قفل المنشن تعطيل_

🔐 `قفل العربية بالتصميت`
🔓 _قفل العربية تعطيل_

🔐 `قفل اعادة التوجيه بالتصميت`
🔓 _قفل اعادة التوجيه تعطيل_

🔐 `قفل توجيه القنوات بالتصميت`
🔓 _قفل توجيه القنوات تعطيل_

🔐 `قفل التسجيلات بالتصميت`
🔓 _قفل التسجيلات تعطيل_

🔐 `قفل صور المتحركة بالتصميت`
🔓 _قفل صور المتحركة تعطيل_

🔐 `قفل الصوتيات بالتصميت`
🔓 _قفل الصوتيات تعطيل_

🔐 `قفل الفيديو بالتصميت`
🔓 _قفل الفيديو تعطيل_

🔐 `قفل المجموعة بالتصميت`
🔓 _قفل المجموعة تعطيل_

🔐 `قفل الصور بالتصميت`
🔓 _قفل الصور تعطيل_

🔐 `قفل ازرار شفافة بالتصميت`
🔓 _قفل ازرار شفافة تعطيل_

🔐 `قفل كيبورد بالتصميت`
🔓 _قفل كيبورد تعطيل_

🔐 `قفل جهات اتصال بالتصميت`
🔓 _قفل جهات اتصال تعطيل_

🔐 `قفل الملفات بالتصميت`
🔓 _قفل الملفات تعطيل_

🔐 `قفل مشاركة الموقع بالتصميت`
🔓 _قفل مشاركة الموقع تعطيل_

🔐 `قفل النصوص بالتصميت`
🔓 _قفل النصوص تعطيل_

🔐 `قفل التعديل بالتصميت`
🔓 _قفل التعديل تعطيل_

🔐 `قفل الملصقات بالتصميت`
🔓 _قفل الملصقات تعطيل_

ℹ️ هذه اوامر لا تحتاج التصميت ⬇️

🔐 `قفل دخول البوتات`
🔓_ فتح دخول البوتات_
🔐 `قفل دخول الاعضاء`
🔓 _فتح دخول الاعضاء_
🔐 `قفل الاشعارات`
🔓 _فتح الاشعارات_
🔐 `قفل التثبيت`
🔓 _فتح التثبيت_
ا➖➖➖➖➖➖➖➖➖➖➖
[📡 جديدنا](https://t.me/joinchat/AAAAAEGk9JrUPUWj9fgIkg)

]]
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🔚 العودة", callback_data="/lock:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/dl' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		text = [[

_📋 اوامر قفل_ *StePhbot* _بالحذف 🗑_

🔐 `قفل الروابط بالحذف`
🔓 _قفل الروابط تعطيل_

🔐 `قفل المعرفات بالحذف`
🔓 _قفل المعرفات تعطيل_

🔐 `قفل روابط المواقع بالحذف`
🔓 _قفل روابط المواقع تعطيل_

🔐 `قفل السبام بالحذف`
🔓 _قفل السبام تعطيل_

🔐 `قفل التكرار بالحذف`
🔓 _قفل التكرار تعطيل_

🔐 `قفل الماركداون بالحذف`
🔓 _قفل الماركداون تعطيل_

🔐 `قفل المنشن بالحذف`
🔓 _قفل المنشن تعطيل_

🔐 `قفل العربية بالحذف`
🔓 _قفل العربية تعطيل_

🔐 `قفل اعادة التوجيه بالحذف`
🔓 _قفل اعادة التوجيه تعطيل_

🔐 `قفل توجيه القنوات بالحذف`
🔓 _قفل توجيه القنوات تعطيل_

🔐 `قفل التسجيلات بالحذف`
🔓 _قفل التسجيلات تعطيل_

🔐 `قفل صور المتحركة بالحذف`
🔓 _قفل صور المتحركة تعطيل_

🔐 `قفل الصوتيات بالحذف`
🔓 _قفل الصوتيات تعطيل_

🔐 `قفل الفيديو بالحذف`
🔓 _قفل الفيديو تعطيل_

🔐 `قفل المجموعة بالحذف`
🔓 _قفل المجموعة تعطيل_

🔐 `قفل الصور بالحذف`
🔓 _قفل الصور تعطيل_

🔐 `قفل ازرار شفافة بالحذف`
🔓 _قفل ازرار شفافة تعطيل_

🔐 `قفل كيبورد بالحذف`
🔓 _قفل كيبورد تعطيل_

🔐 `قفل جهات اتصال بالحذف`
🔓 _قفل جهات اتصال تعطيل_

🔐 `قفل الملفات بالحذف`
🔓 _قفل الملفات تعطيل_

🔐 `قفل مشاركة الموقع بالحذف`
🔓 _قفل مشاركة الموقع تعطيل_

🔐 `قفل النصوص بالحذف`
🔓 _قفل النصوص تعطيل_

🔐 `قفل التعديل بالحذف`
🔓 _قفل التعديل تعطيل_

🔐 `قفل الملصقات بالحذف`
🔓 _قفل الملصقات تعطيل_

ℹ️ هذه اوامر لا تحتاج الحذف ⬇️

🔐 `قفل دخول البوتات`
🔓_ فتح دخول البوتات_
🔐 `قفل دخول الاعضاء`
🔓 _فتح دخول الاعضاء_
🔐 `قفل الاشعارات`
🔓 _فتح الاشعارات_
🔐 `قفل التثبيت`
🔓 _فتح التثبيت_
ا➖➖➖➖➖➖➖➖➖➖➖
[📡 جديدنا](https://t.me/joinchat/AAAAAEGk9JrUPUWj9fgIkg)
]]
		keyboard = {} 
		keyboard.inline_keyboard = {
			{
				{text = "🔚 العودة", callback_data="/lock:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/rep' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		text = [[
            
🔰 `قائمة الاوامر الردود` *AdamBot*

➕ `اضافة رد` *+* *(*`الكلمة او كم كلمة`*) /* `الرد`
_للاضافة الردود_

➖ `حذف رد` *- (*`الكلمة`*)*
_لحذف الردود_


`مثال للاضافة الردود`
_اضافة رد_ *+* _ستيف بوت_ */* _بوت شغال 👍_

`مثال حذف الردود`
_حذف رد_ *-* _ستيف بوت_

ا➖➖➖➖➖➖➖➖➖➖➖
[📡 جديدنا](https://t.me/joinchat/AAAAAEGk9JrUPUWj9fgIkg)

]]
		keyboard = {} 
		keyboard.inline_keyboard = {
			{ 
				{text = "🔚 العودة", callback_data="/help:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/other' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		text = [[
            

_قائمة اوامر AdamBot :_

*📎 اختصار* `[الرابط]`
_لاختصار الروابط في 6 مواقع_

*🎤 الصوت* `[نص]`
_تبديل نص لصوت_

*🔅 ترجمة* `اللغة-الكلمة`
_ترجمة النصوص_

*💕 قلب* `[كلمة اولى] [كلمة ثانية]`
_عمل صورة وسطها قلب_

*✍ زخرفة* `[نص انجليزي]`
_زخرفة انجليزي_

*🔰 الملصق* `[نص]`
_تبديل النص لملصق_

*🖼 الصورة* `[نص]`
_تحويل نص لصورة_

*💠 اذان* `[مدينة]`
_موعد الاذان في مدينة_

*🔢 حساب* `[عدد]`
_حساب الارقام_

*🎈 تحويل لملصق* `[بالرد]`
_تحويل صورة لملصق_

*تحويل لصورة* `[بالرد]`
🖼 _تحويل ملصق لصورة_

*🌞 الطقس* `[المدينة]`
_حالة الطقس في المدينة_

`📎 رابط`
_عرض الرابط بماركداون_

`🔎 بحث صورة [اسم]`
_للبحث عن الصور عبر بوت_

`📧 رقم رسالة [بالرد]`
_عرض رقم رسالة في سيرفر تلجرام_

`🌇 صورة متحركة [اسم بانجليزي]`
_بحث عن صور متحركة عبر بوت_

`📽 يوتيوب [نص]`
_بحث ف يوتيوب وتحميل عبر بوت_

`🗑 مسح رسائلي`
_مسج جميع رسائلك من المجموعة_

`📊 تصويت [النص]`
_للتصويت بشفاف في مجموعة_

`🛢 اخفاء [النص]`
_لاخفاء النص في الزر الشفاف_

`🕹 العب`
_للعب لعبة الحساب مع اصدقاء_

`📲 بحث برنامج`
_للبحث عن البرامج و تحمليها_
ا➖➖➖➖➖➖➖➖➖➖➖
[📡 جديدنا](https://t.me/joinchat/AAAAAEGk9JrUPUWj9fgIkg)
            
            ]]
		keyboard = {} 
		keyboard.inline_keyboard = {
			{ 
				{text = "🔚 العودة", callback_data="/help:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end
if matches[1] == '/slt' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء و الادمن فقط ⛔️")
	else
		text = [[



`● اوامر الصامت AdamBot ● `
          
`🔕 قفل المجموعة`
_وضع صامت للمجموعة_ 
`🔔 فتح المجموعة`
_فتح صامت للمجموعة_ 
`🔕 الصامت`  (ساعات) (دقائق) (ثواني)
_قفل المجموعة بالساعات و الدقائق والثواني_ 
`🔕 الصامت ساعات (رقم)`
_قفل المجموعة بالساعات_ 
`🔕 الصامت دقائق (رقم)`
_قفل المجموعة بالدقائق_ 
`🔕 الصامت ثواني (رقم)`
_قفل المجموعة بالثواني_
`ℹ️ الصامت احصائية`
_للمعرفة كم متبقي في صامت المؤقت_
ا➖➖➖➖➖➖➖➖➖➖➖
[📡 جديدنا](https://t.me/joinchat/AAAAAEGk9JrUPUWj9fgIkg)
            ]]
		keyboard = {} 
		keyboard.inline_keyboard = {
			{ 
				{text = "🔚 العودة", callback_data="/help:"..matches[2]}
			}
		}
		edit_inline(msg.message_id, text, keyboard)
	end
end



         -- ####################### About Us ####################### --
if matches[1] == '/beyond' then
	local text = _config.info_text
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "👥 الدعم", callback_data="/solid:"..matches[2]}, 
			{text = "⭐️ المطورين", callback_data="/toofan:"..matches[2]}
		},
		{
			{text = '📡 جديدنا ', url = 'https://t.me/joinchat/AAAAAEGk9JrUPUWj9fgIkg'}
		},
		{
			{text= '🔚 العودة' ,callback_data = '/option:'..matches[2]}
		}				
	}
    edit_inline(msg.message_id, text, keyboard)
end

if matches[1] == '/solid' then
local text = [[
*-------------------------*
`👥 مجموعة الدعم لل AdamBot للمساعدة او طلب البوت`

[اضغط هنا للدخول المجموعة](https://t.me/joinchat/AAAAAD8bvm1qhxHL5Ofw-g)
*-------------------------*]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "🔚 العودة", callback_data="/beyond:"..matches[2]}
		}
	}
    edit_inline(msg.message_id, text, keyboard)
end
if matches[1] == '/toofan' then
local text = [[`⭐️ مطورين البوت` *AdamBot*

[⭐️ Adam](https://t.me/alameen79)
]]
	keyboard = {} 
	keyboard.inline_keyboard = {
		{
			{text = "🔚 العودة", callback_data="/beyond:"..matches[2]}
		}
	}
    edit_inline(msg.message_id, text, keyboard)
end
if matches[1] == '/exit' then
	if not is_mod1(matches[2], msg.from.id) then
		get_alert(msg.cb_id, "للمدراء في البوت فقط ⛔️")
	else
		local text = '`تم اغلاق الاعدادات الشفافة 🛑`'
		edit_inline(msg.message_id, text)
	end
end

end
--------------End Inline Query---------------
end

local function pre_process(msg)
-- print(serpent.block(msg), {comment=false})
--leave_group(msg.chat.id)
end

return {
	patterns ={
		"^-(%d+)$",
		"^###cb:(%d+)$",
		"^[/](sudolist)$",
		"^[/](setsudo)$",
		"^[/](remsudo)$",
		"^[/](setsudo) (%d+)$",
		"^[/](remsudo) (%d+)$",
		"^[/!#](visudo)$",
		"^[/!#](desudo)$",
		"^[/!#](visudo) (.*)$",
		"^[/!#](desudo) (.*)$",
		"^(سودو)$",
		"^(حذف سودو)$",
		"^(سودو) (.*)$",
		"^(حذف سودو) (.*)$",
		"^[/!#](adminprom)$",
		"^[/!#](admindem)$",
		"^[/!#](adminprom) (.*)$",
		"^[/!#](admindem) (.*)$",
		"^(ادمین)$",
		"^(حذف ادمین)$",
		"^(ادمین) (.*)$",
		"^(حذف ادمین) (.*)$",
		"^###cb:(/option):(.*)$",
		"^###cb:(/lang):(.*)$",
		"^###cb:(/persian):(.*)$",
		"^###cb:(/english):(.*)$",
		"^###cb:(/settings1):(.*)$",
		"^###cb:(/settings2):(.*)$",
		"^###cb:(/settings3):(.*)$",
		"^###cb:(/settings4):(.*)$",
		"^###cb:(/editwarn):(.*)$",
		"^###cb:(/editdel):(.*)$",
		"^###cb:(/editkick):(.*)$",
		"^###cb:(/editsilent):(.*)$",
		"^###cb:(/editok):(.*)$",
		"^###cb:(/textwarn):(.*)$",
		"^###cb:(/textdel):(.*)$",
		"^###cb:(/textkick):(.*)$",
		"^###cb:(/textsilent):(.*)$",
		"^###cb:(/textok):(.*)$",
		"^###cb:(/linkwarn):(.*)$",
		"^###cb:(/linkdel):(.*)$",
		"^###cb:(/linkkick):(.*)$",
		"^###cb:(/linksilent):(.*)$",
		"^###cb:(/linkok):(.*)$",
		"^###cb:(/tagwarn):(.*)$",
		"^###cb:(/tagdel):(.*)$",
		"^###cb:(/tagkick):(.*)$",
		"^###cb:(/tagsilent):(.*)$",
		"^###cb:(/tagok):(.*)$",
		"^###cb:(/mentionwarn):(.*)$",
		"^###cb:(/mentiondel):(.*)$",
		"^###cb:(/mentionkick):(.*)$",
		"^###cb:(/mentionsilent):(.*)$",
		"^###cb:(/mentionok):(.*)$",
		"^###cb:(/arabicwarn):(.*)$",
		"^###cb:(/arabicdel):(.*)$",
		"^###cb:(/arabickick):(.*)$",
		"^###cb:(/arabicsilent):(.*)$",
		"^###cb:(/arabicok):(.*)$",
		"^###cb:(/webwarn):(.*)$",
		"^###cb:(/webdel):(.*)$",
		"^###cb:(/webkick):(.*)$",
		"^###cb:(/websilent):(.*)$",
		"^###cb:(/webok):(.*)$",
		"^###cb:(/markwarn):(.*)$",
		"^###cb:(/markdel):(.*)$",
		"^###cb:(/markkick):(.*)$",
		"^###cb:(/marksilent):(.*)$",
		"^###cb:(/markok):(.*)$",
		"^###cb:(/fwdwarn):(.*)$",
		"^###cb:(/fwddel):(.*)$",
		"^###cb:(/fwdkick):(.*)$",
		"^###cb:(/fwdsilent):(.*)$",
		"^###cb:(/fwdok):(.*)$",
		"^###cb:(/stickerwarn):(.*)$",
		"^###cb:(/stickerdel):(.*)$",
		"^###cb:(/stickerkick):(.*)$",
		"^###cb:(/stickersilent):(.*)$",
		"^###cb:(/stickerok):(.*)$",
		"^###cb:(/videowarn):(.*)$",
		"^###cb:(/videodel):(.*)$",
		"^###cb:(/videokick):(.*)$",
		"^###cb:(/videosilent):(.*)$",
		"^###cb:(/videook):(.*)$",
		"^###cb:(/audiowarn):(.*)$",
		"^###cb:(/audiodel):(.*)$",
		"^###cb:(/audiokick):(.*)$",
		"^###cb:(/audiosilent):(.*)$",
		"^###cb:(/audiook):(.*)$",
		"^###cb:(/voicewarn):(.*)$",
		"^###cb:(/voicedel):(.*)$",
		"^###cb:(/voicekick):(.*)$",
		"^###cb:(/voicesilent):(.*)$",
		"^###cb:(/voiceok):(.*)$",
		"^###cb:(/photowarn):(.*)$",
		"^###cb:(/photodel):(.*)$",
		"^###cb:(/photokick):(.*)$",
		"^###cb:(/photosilent):(.*)$",
		"^###cb:(/photook):(.*)$",
		"^###cb:(/docwarn):(.*)$",
		"^###cb:(/docdel):(.*)$",
		"^###cb:(/dockick):(.*)$",
		"^###cb:(/docsilent):(.*)$",
		"^###cb:(/docok):(.*)$",
		"^###cb:(/locwarn):(.*)$",
		"^###cb:(/locdel):(.*)$",
		"^###cb:(/lockick):(.*)$",
		"^###cb:(/locsilent):(.*)$",
		"^###cb:(/locok):(.*)$",
		"^###cb:(/gifwarn):(.*)$",
		"^###cb:(/gifdel):(.*)$",
		"^###cb:(/gifkick):(.*)$",
		"^###cb:(/gifsilent):(.*)$",
		"^###cb:(/gifok):(.*)$",
		"^###cb:(/chatwarn):(.*)$",
		"^###cb:(/chatdel):(.*)$",
		"^###cb:(/chatkick):(.*)$",
		"^###cb:(/chatsilent):(.*)$",
		"^###cb:(/chatok):(.*)$",
		"^###cb:(/viewwarn):(.*)$",
		"^###cb:(/viewdel):(.*)$",
		"^###cb:(/viewkick):(.*)$",
		"^###cb:(/viewsilent):(.*)$",
		"^###cb:(/viewok):(.*)$",
		"^###cb:(/contwarn):(.*)$",
		"^###cb:(/contdel):(.*)$",
		"^###cb:(/contkick):(.*)$",
		"^###cb:(/contsilent):(.*)$",
		"^###cb:(/contok):(.*)$",
		"^###cb:(/inlinewarn):(.*)$",
		"^###cb:(/inlinedel):(.*)$",
		"^###cb:(/inlinekick):(.*)$",
		"^###cb:(/inlinesilent):(.*)$",
		"^###cb:(/inlineok):(.*)$",
		"^###cb:(/keywarn):(.*)$",
		"^###cb:(/keydel):(.*)$",
		"^###cb:(/keykick):(.*)$",
		"^###cb:(/keysilent):(.*)$",
		"^###cb:(/keyok):(.*)$",
		"^###cb:(/spamwarn):(.*)$",
		"^###cb:(/spamdel):(.*)$",
		"^###cb:(/spamkick):(.*)$",
		"^###cb:(/spamsilent):(.*)$",
		"^###cb:(/spamok):(.*)$",
		"^###cb:(/floodkick):(.*)$",
		"^###cb:(/floodsilent):(.*)$",
		"^###cb:(/floodok):(.*)$",
		"^###cb:(/lockbots):(.*)$",
		"^###cb:(/lockpin):(.*)$",
		"^###cb:(/welcome):(.*)$",
		"^###cb:(/locktgservice):(.*)$",
		"^###cb:(/toofan):(.*)$",
		"^###cb:(/setflood):(.*)$",
		"^###cb:(/floodup):(.*)$",
		"^###cb:(/flooddown):(.*)$",
		"^###cb:(/charup):(.*)$",
		"^###cb:(/chardown):(.*)$",
		"^###cb:(/floodtimeup):(.*)$",
		"^###cb:(/floodtimedown):(.*)$",
		"^###cb:(/moresettings):(.*)$",
		"^###cb:(/more):(.*)$",
		"^###cb:(/ownerlist):(.*)$",
		"^###cb:(/cleanowners):(.*)$",
		"^###cb:(/cleanwlcmsg):(.*)$",
		"^###cb:(/showwlc):(.*)$",
		"^###cb:(/modlist):(.*)$",
		"^###cb:(/cleanmods):(.*)$",
		"^###cb:(/bans):(.*)$",
	 "^###cb:(/cleanbans):(.*)$",
		"^###cb:(/silents):(.*)$",
		"^###cb:(/beyond):(.*)$",
		"^###cb:(/cleansilents):(.*)$",
		"^###cb:(/filterlist):(.*)$",
		"^###cb:(/cleanfilterlist):(.*)$",
		"^###cb:(/whitelist):(.*)$",
		"^###cb:(/cleanwhitelist):(.*)$",
		"^###cb:(/silentlist):(.*)$",
		"^###cb:(/solid):(.*)$",
		"^###cb:(/cleansilentlist):(.*)$",
		"^###cb:(/link):(.*)$",
		"^###cb:(/rules):(.*)$",
		"^###cb:(/cleanrules):(.*)$",
		"^###cb:(/exit):(.*)$",
		"^###cb:(/help):(.*)$",
		"^###cb:(/lock):(.*)$",
		"^###cb:(/all):(.*)$",
		"^###cb:(/other):(.*)$",
		"^###cb:(/slt):(.*)$",
		"^###cb:(/rep):(.*)$",
		"^###cb:(/dev):(.*)$",
		"^###cb:(/thd):(.*)$",
		"^###cb:(/dl):(.*)$",
		"^###cb:(/smt):(.*)$",
		"^###cb:(/trd):(.*)$",

	},
	run=run,
	pre_process=pre_process
}

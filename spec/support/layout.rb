def have_flash(s,type); have_css("div#flash_#{type}",:text=>s) end
def have_notice(s); have_flash(s,:notice) end

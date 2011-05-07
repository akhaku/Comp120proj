module ArtsHelper
  def trimstring(str,tlen)
    if str.length>tlen
      str=str[0..tlen]
      str=str+"..."
    end
    str
  end
end

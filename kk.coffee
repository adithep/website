string3 = "root/aa/(mm/ll(kk:ii/jj/oo))/ii"
string1 = "root/aa:kk:ll"
string = "root/(aa)(ll)(kk)"


matrix = (str, pparr) ->
  n = 0
  bct = 0
  bru = false
  sla = false
  parr = pparr or [0]
  nstr = ""
  while n < str.length
    nstr = nstr + str[n]
    if str[n] is "("
      ostr = nstr.replace(/\($/g, '')
      if ostr.length >=1 and ostr.indexOf("(") is -1
        ostr = ostr.replace(/^\(|\)$/g, '')
        sarr = parr.join(":")
        console.log "#{sarr} #{ostr}"
        parr[parr.length-1]++
        nstr = ""
      bct++
    else if str[n] is ")"
      bct--
    if bct >= 2 or (bct is 1 and (str[n] is ":" or str[n] is "/" ))
      bru = true
    if str[n] is "/"
      sla = true
    else
      sla = false

    if (str[n] is "/" and bct is 0) or (n is str.length - 1)

      nstr = nstr.replace(/^\/|\/$/g, '')
      nstr = nstr.replace(/^\(|\)$/g, '')
      if bru is true
        console.log nstr
        carr = _.clone(parr)
        matrix(nstr, carr)
        bru = false
        parr[parr.length] = 0
        parr[parr.length-1]++
      else
        sarr = parr.join(":")
        console.log "#{sarr} #{nstr}"
        parr[parr.length] = 0
      nstr = ""


    n++

matrix(string)

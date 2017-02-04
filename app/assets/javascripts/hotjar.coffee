((h, o, t, j, a, r) ->
  h.hj = h.hj or ->
    (h.hj.q = h.hj.q or []).push arguments
    return
  h._hjSettings =
    hjid: 408060
    hjsv: 5
  a = o.getElementsByTagName('head')[0]
  r = o.createElement('script')
  r.async = 1
  r.src = t + h._hjSettings.hjid + j + h._hjSettings.hjsv
  a.appendChild r
  return
) window, document, '//static.hotjar.com/c/hotjar-', '.js?sv='
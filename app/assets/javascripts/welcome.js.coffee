###
  Copy text from any appropriate field to the clipboard
  By Craig Buckler, @craigbuckler
  use it, abuse it, do whatever you like with it!
###

do ->
  # event handler

  copy = (e) ->
    # find target element
    t = e.target
    c = t.dataset.copytarget
    inp = if c then document.querySelector(c) else null
    # is element selectable?
    if inp and inp.select
      # select text
      inp.select()
      try
        # copy text
        document.execCommand 'copy'
        inp.blur()
        # copied animation
        t.classList.add 'copied'
        setTimeout (->
          t.classList.remove 'copied'
          return
        ), 1500
      catch err
        alert 'please press Ctrl/Cmd+C to copy'
    return

  'use strict'
  # click events
  document.body.addEventListener 'click', copy, true
  return

# ---
# generated by js2coffee 2.2.0
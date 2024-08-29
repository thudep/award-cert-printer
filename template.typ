#set page(paper: "a4",flipped: true, margin: (x: 0em,y:0em),background: image("bg.svg"))

#let tsinghua_purple=rgb(106,8,116)

#set text(tracking: 1.5pt)

#place(center,dy:10em, text(font: "Source Han Serif", lang: "zh", region: "cn",[*获奖证书*], size: 40pt,fill:tsinghua_purple))

#place(left,dy:19em,dx:14%, text(font: "Source Han Serif", lang: "zh", region: "cn",strong(underline[#include "name.typ"]), size: 28pt))

#place(left,dy:19em,dx:26%, text(font: "Source Han Serif", lang: "zh", region: "cn",[*同学*], size: 24pt, fill:tsinghua_purple))

#place(center,dy:28em, text(font: "Source Han Serif", lang: "zh", region: "cn",strong(underline[#include "prize.typ"]), size: 28pt))

#place(center,dy:24em,dx:-20%, text(font: "Source Han Serif", lang: "zh", region: "cn",[*你在*], size: 22pt,fill:tsinghua_purple))

#place(center,dy:24em, text(font: "Source Han Serif", lang: "zh", region: "cn",strong(underline[#include "contest.typ"]), size: 22pt))

#place(center,dy:24em,dx:21%, text(font: "Source Han Serif", lang: "zh", region: "cn",[*中荣获*], size: 22pt,fill:tsinghua_purple))

#place(left,dy:32em,dx:14%, text(font: "Source Han Serif", lang: "zh", region: "cn",[*特发此证，以资鼓励*], size: 22pt,fill:tsinghua_purple))

#place(left,dy:40em,dx:66%, text(font: "Source Han Serif", lang: "zh", region: "cn",[*清华大学工程物理系*], size: 20pt,fill:tsinghua_purple))

#place(center,dy:35em,dx:-24%, image("dep.jpg",width: 9em))

#place(left,dy:47em,dx:14%, text(font: "Source Han Serif", lang: "zh", region: "cn",[*证书摘要*], size: 14pt,fill:tsinghua_purple))

#let try_to_string(content) = {
  if content.has("text") {
    content.text
  } else if content.has("children") {
    content.children.map(try_to_string).join("")
  } else if content.has("body") {
    to-string(content.body)
  } else if content == [ ] {
    " "
  }
}

#place(left,dy:47em,dx:22%, text(raw(try_to_string([#include "fingerprint.typ"])), size: 16pt, fill:tsinghua_purple))


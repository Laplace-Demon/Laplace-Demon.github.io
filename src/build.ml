open Tyxml.Html

let static_page =
  html
    (head (title (txt "静态生成页面")) [ meta ~a:[a_charset "UTF-8"] () ])
    (body [
      h1 [ txt "这是一个静态生成的 HTML 页面" ];
      p [ txt "OCaml 生成的内容" ]
    ])

let () =
  let html_string = Format.asprintf "%a" (pp ()) static_page in
  let oc = open_out "generated.html" in
  output_string oc html_string;
  close_out oc

module U = RedUnix

let write_to fout str =
  let n = String.length str in
  ignore (U.write fout str 0 n)

let read_form fin =
  let b_size = 1024 * 8 in
  let s_size = 1024 * 8 in
  let s = String.create s_size in
  let b = Buffer.create b_size in
  let rec aux () =
    match U.read fin s 0 s_size with
    | 0 -> Buffer.contents b
    | n -> Buffer.add_substring b s 0 n; aux ()
  in
  aux ()

let client () =
  let server_name = "linux-nantes.org" in
  let port_number = 80 in
  let req = "GET /~fmonnier/ocaml/ HTTP/1.0\r\n\r\n" in
  let server_addr =
    try (U.gethostbyname server_name).U.h_addr_list.(0)
    with Not_found ->
      prerr_endline (server_name ^ ": Host not found");
      exit 2
  in
  let sock = U.socket U.PF_INET U.SOCK_STREAM 0 in
  U.connect sock (U.ADDR_INET(server_addr, port_number));
  write_to sock req;
  let ans = read_form sock in
  print_endline ans;
;;

let test () =
  ignore (U.handle_unix_error client ())

let () = test ()

open Core.Std

let () =
  In_channel.read_all "book.json" 
  |> Book_j.book_of_string
  |> fun book ->
  let open Book_t in
  let names = List.map book.authors ~f:(fun author -> author.name) in
  (* Print the results of the parsing *)
  printf "Title: %s (%d)\n" book.title book.pages;
  printf "Authors: %s\n" (String.concat ~sep:", " names);
  printf "Tags: %s\n" (String.concat ~sep:", " book.tags);
  printf "Online: %B\n" (Option.value ~default:false book.is_online);
  printf "Translated: %B\n" (Option.value ~default:false book.is_translated)


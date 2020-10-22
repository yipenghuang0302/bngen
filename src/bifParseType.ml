(******************************************************************************)
(* The Libra Toolkit                                                          *)
(*                                                                            *)
(* Copyright (C) 2015 by Daniel Lowd and Amirmohammad Rooshenas               *)
(* All rights reserved.                                                       *)
(*                                                                            *)
(* Redistribution and use in source and binary forms, with or without         *)
(* modification, are permitted provided that the following conditions are     *)
(* met:                                                                       *)
(*                                                                            *)
(* 1. Redistributions of source code must retain the above copyright          *)
(* notice, this list of conditions and the following disclaimer.              *)
(*                                                                            *)
(* 2. Redistributions in binary form must reproduce the above copyright       *)
(* notice, this list of conditions and the following disclaimer in the        *)
(* documentation and/or other materials provided with the distribution.       *)
(*                                                                            *)
(* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS        *)
(* "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT          *)
(* LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR      *)
(* A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT       *)
(* OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,      *)
(* SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT           *)
(* LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,      *)
(* DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY      *)
(* THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT        *)
(* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE      *)
(* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.       *)
(******************************************************************************)

type bifNumStr = {s:string; is_complex:bool; c:Complex.t; is_float:bool; f:float; is_int:bool; i:int}
type bifVariable = string * (string list)
type bifProbability = (string * string list) * (string list * Complex.t list) list
type bif = string * (bifVariable list) * (bifProbability list)

let s_ident str = {s=str; is_complex=false; c=Complex.zero; is_float=false; f=0.0; is_int=false; i=0}
let c_ident str = {s=str; is_complex=true; c={re=float_of_string (List.hd (String.split_on_char '+' str));im=float_of_string (List.hd (String.split_on_char 'i' (List.hd (List.rev (String.split_on_char '+' str)))))}; is_float=false; f=0.0;
                   is_int=false; i=0}
let f_ident str = {s=str; is_complex=true; c={re=float_of_string str;im=0.0}; is_float=true; f=float_of_string str;
                   is_int=false; i=0}
let i_ident str = {s=str; is_complex=true; c={re=float_of_string str;im=0.0}; is_float=true; f=float_of_string str;
                   is_int=true; i=int_of_string str}

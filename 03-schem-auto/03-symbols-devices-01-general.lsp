;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ןנטבמנû                                                     ////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:03-symbols-devices-01-general

( / adoc dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 str-01 str-06 switch txt-up type-list)

(setvar "cmdecho" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-01 (list "TG" "TT" "TE")
			list-02 (list "PG" "PGS" "PT" "PS")
			list-03 (list "PDG" "PDT")
			list-04 (list "FE" "FT")
			list-05 (list "LE" "LT" "LS")
			list-06 (list "10 לל" "15 לל" "10 לל רךאפ")
			list-07 (list "QTSA")
			str-06 "10 לל"
			switch nil
);setq

(if (< (setq dcl-id (load_dialog "dia-03-symbols-devices-01-general.dcl")) 0) ;טשול הטאכמד
		(progn
			(alert "Íו םאיהום dcl-פאיכ")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_03_symbols_devices_general" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)

(set_tile "txt-06" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-01 (nth (atoi (get_tile \"txt-02\")) list-02))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq str-01 (nth (atoi (get_tile \"txt-03\")) list-03))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-04"
  (strcat "(setq str-01 (nth (atoi (get_tile \"txt-04\")) list-04))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-05"
  (strcat "(setq str-01 (nth (atoi (get_tile \"txt-05\")) list-05))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-07"
  (strcat "(setq str-01 (nth (atoi (get_tile \"txt-07\")) list-07))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-06"
  (strcat "(setq str-06 (nth (atoi (get_tile \"txt-06\")) list-06))");strcat
);action_tile

;חאלוםא עוךסעא
(action_tile "but-01"
  (strcat "(setq switch 1)"
  				"(mode_tile \"but-01\" 1)"
  );srcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (wcmatch str-01 "*G*")
	(cond
		((= str-01 "TG") (setq txt-up "*** %%dC"));=
		((= str-01 "PG") (setq txt-up "*** ÌÏא"));=
		((= str-01 "PGS") (setq txt-up "*** ÌÏא"));=
		((= str-01 "PDG") (setq txt-up "*** ךÏא"));=
	);cond
);if

(if (= switch nil)
	(cond
		((= str-06 "10 לל") 
			(load "d:\\yandexdisk\\my-sprt\\03-schem-auto\\03-symbols-devices-02-10-mm.lsp")
			(03-symbols-devices-02-10-mm str-01 txt-up)
		);=

		((= str-06 "15 לל") 
			(load "d:\\yandexdisk\\my-sprt\\03-schem-auto\\03-symbols-devices-02-15-mm.lsp") 
			(03-symbols-devices-02-15-mm str-01 txt-up)
		);=
		
		((= str-06 "10 לל רךאפ") 
			(load "d:\\yandexdisk\\my-sprt\\03-schem-auto\\03-symbols-devices-02-10-mm-box.lsp") 
			(03-symbols-devices-02-10-mm-box str-01 txt-up)		
		);=
	);progn
);if

(if (= switch 1)
	(progn
		(load "d:\\yandexdisk\\my-sprt\\03-schem-automation\\03-symbols-devices-03-change.lsp") 
		(03-symbols-devices-03-change type-list)
	);progn
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// ךמםוצ ןנמדנאללû ///////////////////////////////////////
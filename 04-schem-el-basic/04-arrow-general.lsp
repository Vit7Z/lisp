;/////// ************************************************************ //////////////////////////////
;/////// выбор длины стрелки                                          //////////////////////////////
;/////// ************************************************************ //////////////////////////////
(defun c:04-arrow-general

( / adoc dcl-id list-01 list-02 list-03 list-04 list-05 txt-01 txt-02 txt-03 txt-04 txt-05)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-01 (list "6" "10" "12" "14" "18" "20")
			list-02 (list "Стандарт, направл." "PE" "Линия сечения" "Разрез" "Треугольная, 2мм" "Треугольная, 3мм" "Треугольная, 5мм")
			list-03 (list "+24-1 up" "+24-2 up" "+24-3 up" "+24-4 up" "+24-5 up" "+24-6 up" "+24-7 up" "+24-8 up" "+24-9 up"
			              "+24-10 up" "+24-11 up" "+24-12 up" "+24-13 up" "+24-14 up" "+24-15 up" "+24-16 up" "+24-17 up" "+24-18 up"
			              "+24-19 up" "+24-20 up")
			              
			list-04 (list "+24-1 down" "+24-2 down" "+24-3 down" "+24-4 down" "+24-5 down" "+24-6 down" "+24-7 down" "+24-8 down" "+24-9 down"
			              "+24-10 down" "+24-11 down" "+24-12 down" "+24-13 down" "+24-14 down" "+24-15 down" "+24-16 down" "+24-17 down" "+24-18 down"
			              "+24-19 down" "+24-20 down")
			              
			list-05 (list "-24-1 up" "-24-1 down" "-24-2 up" "-24-2 down")
);setq

(if (< (setq dcl-id (load_dialog "dia-04-arrow-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_04_arrow_general" dcl-id))
	(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)

(action_tile "txt-01"
  (strcat "(setq txt-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq txt-02 (nth (atoi (get_tile \"txt-02\")) list-02))"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq txt-03 (nth (atoi (get_tile \"txt-03\")) list-03))"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(setq txt-04 (nth (atoi (get_tile \"txt-04\")) list-04))"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(setq txt-05 (nth (atoi (get_tile \"txt-05\")) list-05))"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

;///////////////////////////////////////////////////////////////////////////////////////////////////
(if (/= txt-01 nil)
  (progn
    (setq txt-01 (atoi txt-01))
    (load "d:\\yandexdisk\\my-sprt\\04-schem-el-basic\\04-arrow-01.lsp") 
    (04-arrow-01 txt-01)
  );progn
);setq

;///////////////////////////////////////////////////////////////////////////////////////////////////
(cond
	((= txt-02 "PE") (load "d:\\yandexdisk\\my-sprt\\04-schem-el-basic\\04-arrow-02.lsp") (04-arrow-02));=
	((= txt-02 "Разрез") (load "d:\\yandexdisk\\my-sprt\\04-schem-el-basic\\04-arrow-03.lsp") (04-arrow-03));=
	((= txt-02 "Линия сечения") (load "d:\\yandexdisk\\my-sprt\\04-schem-el-basic\\04-arrow-04.lsp") (04-arrow-04));=
	((= txt-02 "Треугольная, 2мм") (load "d:\\yandexdisk\\my-sprt\\04-schem-el-basic\\04-arrow-06.lsp") (04-arrow-06 2));=
	((= txt-02 "Треугольная, 3мм") (load "d:\\yandexdisk\\my-sprt\\04-schem-el-basic\\04-arrow-06.lsp") (04-arrow-06 3));=
	((= txt-02 "Треугольная, 5мм") (load "d:\\yandexdisk\\my-sprt\\04-schem-el-basic\\04-arrow-06.lsp") (04-arrow-06 5));=
	((= txt-02 "Стандарт, направл.") (load "d:\\yandexdisk\\my-sprt\\04-schem-el-basic\\04-arrow-05.lsp") (04-arrow-05));=
);cond

;///////////////////////////////////////////////////////////////////////////////////////////////////
(if (/= txt-03 nil)
  (progn
    (load "d:\\yandexdisk\\my-sprt\\04-schem-el-basic\\04-arrow-01-03.lsp") 
    (04-arrow-01-03 txt-03)
  );progn
);setq

;///////////////////////////////////////////////////////////////////////////////////////////////////
(if (/= txt-04 nil)
  (progn
    (load "d:\\yandexdisk\\my-sprt\\04-schem-el-basic\\04-arrow-01-03.lsp") 
    (04-arrow-01-03 txt-04)
  );progn
);setq

;///////////////////////////////////////////////////////////////////////////////////////////////////
(if (/= txt-05 nil)
  (progn
    (load "d:\\yandexdisk\\my-sprt\\04-schem-el-basic\\04-arrow-01-03.lsp") 
    (04-arrow-01-03 txt-05)
  );progn
);setq

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(princ)
)

;/////// *************************************************************//////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              //////////////////////////////
;/////// *************************************************************//////////////////////////////
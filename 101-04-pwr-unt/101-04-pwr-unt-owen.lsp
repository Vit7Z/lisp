;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;///////                                                                   /////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun 101-04-pwr-unt-owen

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 
list-05-read-file list-06 list-06-read-file list-07-read-file list-1001 list-901 list-902 list-99 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-901 nil
      list-902 nil
      list-1001 nil
);setq

(read-file-for-dialog-box "101-04-pwr-unt-owen.txt" 7)

(setq list-01 list-01-read-file
			list-02 list-02-read-file
			list-03 list-03-read-file
			list-04 list-04-read-file
			list-05 list-05-read-file
			list-06 list-06-read-file
			list-99 list-07-read-file
);setq

(if (< (setq dcl-id (load_dialog "dia-101-04-pwr-unt-owen.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_04_pwr_unt_owen" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-99" list-99)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(setq str-txt (get_tile \"txt-01\"))"
  				"(set_tile \"txt-02\" str-txt)"
  				"(set_tile \"txt-03\" str-txt)"
  				"(set_tile \"txt-04\" str-txt)"
  				"(set_tile \"txt-05\" str-txt)"
  				"(set_tile \"txt-06\" str-txt)"
  				"(set_tile \"txt-99\" str-txt)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-txt (get_tile \"txt-02\"))"
  				"(set_tile \"txt-01\" str-txt)"
  				"(set_tile \"txt-03\" str-txt)"
  				"(set_tile \"txt-04\" str-txt)"
  				"(set_tile \"txt-05\" str-txt)"
  				"(set_tile \"txt-06\" str-txt)"
  				"(set_tile \"txt-99\" str-txt)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq str-txt (get_tile \"txt-03\"))"
  				"(set_tile \"txt-01\" str-txt)"
  				"(set_tile \"txt-02\" str-txt)"
  				"(set_tile \"txt-04\" str-txt)"
  				"(set_tile \"txt-05\" str-txt)"
  				"(set_tile \"txt-06\" str-txt)"
  				"(set_tile \"txt-99\" str-txt)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(setq str-txt (get_tile \"txt-04\"))"
  				"(set_tile \"txt-01\" str-txt)"
  				"(set_tile \"txt-02\" str-txt)"
  				"(set_tile \"txt-03\" str-txt)"
  				"(set_tile \"txt-05\" str-txt)"
  				"(set_tile \"txt-06\" str-txt)"
  				"(set_tile \"txt-99\" str-txt)"
  );srcat
);action_tile


(action_tile "but1"
  (strcat "(tmp-1-101-04-pwr-unt-owen)");strcat
);action_tile
  
(action_tile "but2"
  (strcat "(setq type-list \"le\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"spcf\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but4"
  (strcat "(setq type-list \"lecgv\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but5"
  (strcat "(setq str-901 (get_tile \"txt-901\"))"
  				"(list-delete-item-from-list-01 list-901 str-901)"
  				"(list-filling \"txt-901\" list-1001)"
  				"(setq list-901 list-1001)"  				
  				"(list-delete-item-from-list-01 list-902 str-901)"
  				"(setq list-902 list-1001)"  				
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (le-101-04-pwr-unt-owen));if

(if (= type-list "spcf") (spcf-101-04-pwr-unt-owen));if

(if (= type-list "lecgv") (lecgv-101-04-pwr-unt-owen));if

(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-1-101-04-pwr-unt-owen

( / str-01 str-02 str-03 str-04 str-05 str-99 tmp-list-902)

(setq str-01 (get_tile "txt-01"));setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(setq list-901 (vl-list* (strcat str-01 "  U  " str-02 "В  Ток " str-04 "А") list-901)

			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 str-99))
);setq

(setq list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-pwr-unt-owen

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
 	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
 				str-701 (strcat "Блок питания Овен " str-01 ", Uвых. =" str-02 "В, Iмакс. на канал " str-04 "А, кол. каналов " str-03)
 				str-702 nil 
 	);setq
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins);
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-04-pwr-unt-owen

( / cntr-1 nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-05 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
 
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

 
	(command "_TEXT" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-ins 4)) 2.5 0 "Блок питания");наименование
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 12)) 2.5 0 (strcat "- выходное напряжение =" str-02 "В, максимальный ток нагрузки " str-04 "А"))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins 20)) 2.5 0 (strcat "- количество каналов " str-03 ", крепление " str-05))
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 4)) 2.5 0 (strcat str-01))
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins 4)) 2.5 0 "шт.");количество
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- y-pnt-ins 4)) 2.5 0 "Овен, г. Москва");производитель
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 322.5) (- y-pnt-ins 4)) 2.5 0 str-99)

	(repeat nmbr-ln
		(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-pwr-unt-owen

( / cntr-1 nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
			x-pnt-ins (nth 0 pnt-ins)
			y-pnt-ins (nth 1 pnt-ins)
			y-pnt-ins-1 y-pnt-ins
			nmbr-ln 5
	);setq
 
	(09-empt-lin-le-cgv)

	(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)

	(command "_TEXT" "_ML" (list (+ x-pnt-ins 61) (- y-pnt-ins 4)) 2.5 0 (strcat "Блок питания Овен " str-01 ","))
	(command "_TEXT" "_ML" (list (+ x-pnt-ins 61) (- y-pnt-ins 12)) 2.5 0 (strcat "вых. напряжение =" str-02 "В,"))
	(command "_TEXT" "_ML" (list (+ x-pnt-ins 61) (- y-pnt-ins 20)) 2.5 0 (strcat "макс. ток " str-04 "А (на 1 канал),"))
	(command "_TEXT" "_ML" (list (+ x-pnt-ins 61) (- y-pnt-ins 28)) 2.5 0 (strcat "кол. каналов " str-03))
	;
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- y-pnt-ins 4)) 2.5 0 str-99)
	;
	(repeat nmbr-ln
		(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

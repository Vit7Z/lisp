;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-pwr-unt-ups-apc

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-801 list-802 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-04-pwr-unt-ups-apc-01-general.txt" 3)

(setq list-901 nil
      list-902 nil
			
			str-01 nil

			list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(txt-01-101-04-pwr-ups-apc)

(if (< (setq dcl-id (load_dialog "dia-101-04-pwr-unt-ups-apc.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_apc" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-99" list-99)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(txt-01-101-04-pwr-ups-apc)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(filling-fields-101-04-pwr-unt-ups-apc)"
  );strcat
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
  (strcat "(list-delete-item)");strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (le-101-04-pwr-unt-ups-apc));if

(if (= type-list "spcf") (spcf-101-04-pwr-unt-ups-apc));if

(if (= type-list "lecgv") (lecgv-101-04-pwr-unt-ups-apc));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-04-pwr-ups-apc

( / htxt-list list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-1001-read-file name-file-1 num-flds)

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01)
				name-file-1 (nth 0 list-801)
				num-flds (atoi (nth 0 list-802))
	);setq
	
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
				name-file-1 (nth (atoi (get_tile "txt-01")) list-801)
				num-flds (atoi (nth (atoi (get_tile "txt-01")) list-802))
	);setq
);if

(cond
	((= str-01 "ИБП")
		(setq htxt-list (list "Обозначение" "" "Артикул" "" "Uвх.," "В" "Мощность" ""));setq
	);=

	((= str-01 "Батарея")
		(setq htxt-list (list "Совместимость" "арт. ИБП" "Артикул" "" "" "" "" ""));setq
	);=
);cond

(set_tile "htxt-021" (nth 0 htxt-list))
(set_tile "htxt-022" (nth 1 htxt-list))

(set_tile "htxt-031" (nth 2 htxt-list))
(set_tile "htxt-032" (nth 3 htxt-list))

(set_tile "htxt-041" (nth 4 htxt-list))
(set_tile "htxt-042" (nth 5 htxt-list))

(set_tile "htxt-051" (nth 6 htxt-list))
(set_tile "htxt-052" (nth 7 htxt-list))

(read-file-for-dialog-box-01 name-file-1 num-flds)

(divide-text-into-parts-02-list-text list-1001-read-file 100)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-99 list-05-read-file	
			list-1001 list-1001-read-file
);setq

(cond
	((= str-01 "Батарея")
		(setq list-99 list-04
					list-04 nil
		);setq
	);=
);cond

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-99" list-99)
(list-filling "txt-1001" list-1001)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-04-pwr-unt-ups-apc

( / str-01 str-02 str-03 str-04 str-05 str-902 str-99 swtch)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
      swtch list-901
);setq

(if (/= swtch nil)
	(setq list-902 (reverse list-902)
				list-901 (reverse list-901)
	);setq
);if

(if (= str-01 "ИБП")
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-05 (nth (atoi (get_tile "txt-05")) list-05)
				
				str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 str-99))
				list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-03 "  " str-05) list-901)
	);setq
);if

(if (= str-01 "Батарея")
	(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-99))
				list-901 (vl-list* (strcat str-01 "  " str-03 "  Совместимость " str-02) list-901)
	);setq
);if

(setq list-902 (vl-list*  str-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq


(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-pwr-unt-ups-apc

( / cntr-1 pnt-ins str str-01 str-02 str-03 str-04 str-05 str-701 str-702)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str))
				str-02 (cdr (assoc 2 str))
				str-03 (cdr (assoc 3 str))
				str-04 (cdr (assoc 4 str))
				str-05 (cdr (assoc 5 str))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;;;/////////
	(if (= str-01 "ИБП")
		(setq str-701 (strcat "Источник бесперебойного питания, " str-02 ", артикул " str-03 ", Uвх. " str-04 "В, мощность " str-05)
					str-702 nil
		);setq
	);if

	;;;;;;;;;/////////
	(if (= str-01 "Батарея")
		(setq str-701 (strcat "Батарея для источника бесперебойного питания, " str-02 ", артикул " str-03)
					str-702 nil
		);setq
	);if

	(split-str-parts-le-01-general str-701 str-702 pnt-ins);
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun spcf-101-04-pwr-unt-ups-apc

( / cntr-1 dlt-y nmbr-ln pnt-ins str str-01 str-02 str-03 str-04 str-05 str-99 str-not str-patrn str-txt str-unt x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str))
				str-02 (cdr (assoc 2 str))
				str-03 (cdr (assoc 3 str))
				str-04 (cdr (assoc 4 str))
				str-05 (cdr (assoc 5 str))
				str-99 (cdr (assoc 99 str))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	);setq
	
	(101-empt-lin-spcf)

	;;;;;;;;;/////////
	(if (= str-01 "ИБП")
		(progn
			(setq nmbr-ln 3
						str-txt (strcat str-02 ", артикул " str-03)
						str-not nil
						str-patrn " "
						str-unt "шт."
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
	
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Источник бесперебойного питания"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- Uвх. " str-04 "В, мощность " str-05))
		);progn
	);if

	;;;;;;;;;/////////
	(if (= str-01 "Батарея")
		(progn
			(setq nmbr-ln 3
						str-txt (strcat "Артикул " str-03)
						str-not nil
						str-patrn " "
						str-unt "компл."
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
	
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Батарея для источника бесперебойного питания"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- совместимость " str-02))
		);progn
	);if

	(split-str-parts-spcf-60-01 str-txt str-not str-patrn pnt-ins);
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "APC,")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "http://www.apc.ru/")
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-unt)
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99);масса
	
	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-pwr-unt-ups-apc

( / cntr-1 pnt-ins str str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-703 str-99)

(setq cntr-1 0);setq

(repeat (length list-902)

	(setq str (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str))
				str-02 (cdr (assoc 2 str))
				str-03 (cdr (assoc 3 str))
				str-04 (cdr (assoc 4 str))
				str-05 (cdr (assoc 5 str))
				str-99 (cdr (assoc 99 str))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;;;/////////
	(if (= str-01 "ИБП")
		(setq str-701 (strcat "Источник бесперебойного питания, " str-02 ", артикул " str-03 ", Uвх. " str-04 "В, мощность " str-05)
					str-702 nil
					str-703 nil
		);setq
	);if

	;;;;;;;;;/////////
	(if (= str-01 "Батарея")
		(setq str-701 (strcat "Батарея для источника бесперебойного питания, " str-02 ", артикул " str-03)
					str-702 nil
					str-703 nil
		);setq
	);if

	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////











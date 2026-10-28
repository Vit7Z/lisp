;/////// ************************************************************ ////////////////////////////////////////
;///////                                                              ////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////
(defun 101-07-mtrl-pipe-imp-01

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 
list-801 list-802 list-900 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-07-mtrl-pipe-imp-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file

      list-901 nil
      list-902 nil
      
      str-01 nil
);setq

(txt-01-101-07-mtrl-pipe-imp-01)

(if (< (setq dcl-id (load_dialog "dia-101-07-mtrl-pipe-imp-01.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_07_mtrl_pipe_imp_01" dcl-id))
	(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")

(action_tile "txt-01"
  (strcat "(txt-01-101-07-mtrl-pipe-imp-01)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(txt-02-101-07-mtrl-pipe-imp-01)");srcat
);action_tile

(action_tile "txt-05"
  (strcat "(txt-05-101-07-mtrl-pipe-imp-01)");srcat
);action_tile

(action_tile "but1"
  (strcat "(fill-fields-101-07-mtrl-pipe-imp-01)");strcat
);action_tile

(action_tile "but2"
  (strcat "(setq type-list \"le\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"ledae\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but4"
  (strcat "(setq type-list \"spcf\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (le-101-07-mtrl-pipe-imp-01));if
(if (= type-list "ledae") (ledae-101-07-mtrl-pipe-imp-01));if
(if (= type-list "spcf") (spcf-101-07-mtrl-pipe-imp-01));if

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;/////// конец программы /////////////////////////////////////////////////////////////////////////////////////

;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-07-mtrl-pipe-imp-01

( / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-900-dscr list-900-menu list-900-read-file name-file-1 num-flds)

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

(read-file-for-dialog-box-01 name-file-1 num-flds)

;list-900-menu - список заголовков, list-900-dscr

(set_tile "ptxt-21" (nth 0 list-900-menu))
(set_tile "ptxt-22" (nth 1 list-900-menu))
(set_tile "ptxt-23" (nth 2 list-900-menu))

(set_tile "ptxt-31" (nth 3 list-900-menu))
(set_tile "ptxt-32" (nth 4 list-900-menu))
(set_tile "ptxt-33" (nth 5 list-900-menu))

(set_tile "ptxt-41" (nth 6 list-900-menu))
(set_tile "ptxt-42" (nth 7 list-900-menu))
(set_tile "ptxt-43" (nth 8 list-900-menu))

(set_tile "ptxt-51" (nth 9 list-900-menu))
(set_tile "ptxt-52" (nth 10 list-900-menu))
(set_tile "ptxt-53" (nth 11 list-900-menu))

(divide-text-into-parts list-900-dscr 90)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-900 list-900-read-file
);setq

(if (= str-01 "ГОСТ 8734")
	(setq list-05 (list "10 ГОСТ 1050-2013" 
											"20 ГОСТ 1050-2013" 
											"В10 ГОСТ 8733-75" 
											"В20 ГОСТ 8733-75")
	);setq
);if

(if (= str-01 "ГОСТ 617")
	(setq list-04 (list "ДКРНТ")
				list-05 (list "М2 БУ")
	);setq
);if 

(if (= str-01 "ГОСТ 9941")
	(setq list-05 (list "12Х18Н10Т"));setq
);if

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрогамма выбора данных/////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-07-mtrl-pipe-imp-01

( / str-01 str-02)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (get_tile "txt-02")
);setq

(if (or (= str-01 "ГОСТ 9941") 
				(= str-01 "ГОСТ 8734"))
	(progn
    (set_tile "txt-03" str-02)
    (set_tile "txt-04" str-02)
	);progn
);if

(if (= str-01 "ГОСТ 617")
	(progn
		(set_tile "txt-03" str-02)
	);progn
);if

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрогамма выбора данных/////////////////////////////////////////////////////////////////////////////////
(defun txt-05-101-07-mtrl-pipe-imp-01

( / list-01-read-file list-02-read-file list-03-read-file str-01 str-02 str-05)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
		  str-02 (get_tile "txt-02")
		  str-05 (nth (atoi (get_tile "txt-05")) list-05)
);setq

(if (= str-01 "ГОСТ 9941")
	(progn
		(cond
			((= str-05 "12Х18Н10Т") (read-file-for-dialog-box "101-07-pipes-gost-9941-12h18n10t.txt" 3));=
			((= str-05 "12Х18Н12Т") (read-file-for-dialog-box "101-07-pipes-gost-9941-12h18n12t.txt" 3));=
		);cond
		
		(list-filling "txt-02" list-01-read-file)
		(list-filling "txt-03" list-02-read-file)
		(list-filling "txt-04" list-03-read-file)
		
		(set_tile "txt-02" str-02)
		(set_tile "txt-03" str-02)
		(set_tile "txt-04" str-02)
	);progn
);if


(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных//////////////////////////////////////////////////////////////////////////
(defun fill-fields-101-07-mtrl-pipe-imp-01

( / str-01 str-02 str-03 str-04 str-05 tmp-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(if (= str-01 "ГОСТ 8734")
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
								
				tmp-902 (list (cons 1 str-01) (cons 2 str-02) (cons 99 str-03) (cons 5 str-05))
				list-901 (vl-list* (strcat str-01 "  " str-02 "  Сталь " str-05) list-901)
	);setq
);if

(if (= str-01 "ГОСТ 9941")
	(setq tmp-902 (list (cons 1 str-01) (cons 2 str-02) (cons 99 str-03) (cons 5 str-05))
				list-901 (vl-list* (strcat str-01 "  " str-02 "  Сталь " str-05) list-901)
	);setq
);if

(if (= str-01 "ГОСТ 617")
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-02 (strcat str-04 " " str-02 " " str-05)
				
				tmp-902 (list (cons 1 str-01) (cons 2 str-02) (cons 99 str-03))
				list-901 (vl-list* (strcat str-01 "  " str-02) list-901)
	);setq
);if

(setq list-902 (vl-list* tmp-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   ///////////////////////////////////////////////////////////////
(defun le-101-07-mtrl-pipe-imp-01

( / cntr-1 pnt-ins str-01 str-02 str-05 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(if (= "ГОСТ 8734" str-01)
		(setq str-701 (strcat "Труба " str-02 " ГОСТ 8734-75 из стали " str-05)
					str-702 "Кол. в метрах"
		);setq
	);if

	(if (= "ГОСТ 9941" str-01)
		(setq str-701 (strcat "Труба " str-02 " ГОСТ 9941-81 из стали " str-05)
					str-702 "Кол. в метрах"
		);setq
	);if

	(if (= "ГОСТ 617" str-01)
		(setq str-701 (strcat "Труба " str-02 " ГОСТ 617-2006")
					str-702 "Кол. в метрах"
		);setq
	);if

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**2**");
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ ЧРО               ///////////////////////////////////////////////////////////////
(defun ledae-101-07-mtrl-pipe-imp-01

( / cntr-1 pnt-ins st-1 str-01 str-02 str-05 str-701 str-702 str-703 str-99 str-tmp str-txt str-txt-01 
str-txt-02 str-txt-99)

(setq cntr-1 0);setq

(repeat (length list-902)
  (setvar "osmode" 6199)
  
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
				str-703 "Кол. в метрах"
				
				pnt-ins (getpoint "\nУкажите точку вставки\n")	
		    st-1 (ssget "_c" (list (+ (nth 0 pnt-ins) 59.5) (- (nth 1 pnt-ins) 2)) (list (+ (nth 0 pnt-ins) 0.5) (- (nth 1 pnt-ins) 4)))
	);setq

	(if (/= st-1 nil) 
	  (command "_erase" st-1 "")
	);if
		
	;;;;;;;;//////////////////////////////////////////////////
	(if (= "ГОСТ 8734" str-01)
		(setq str-701 (strcat "Труба " str-02 ", материал сталь " str-05)
					str-702 "ГОСТ 8734-75"					
		);setq
	);if
	
	;;;;;;;;//////////////////////////////////////////////////
	(if (= "ГОСТ 9941" str-01)
		(setq str-701 (strcat "Труба " str-02 "-" str-05 " (коррозионно-стойкая)")
					str-702 "ГОСТ 9941-81"
		);setq
	);if
	
	;;;;;;;;//////////////////////////////////////////////////
	(if (= "ГОСТ 617" str-01)
		(setq str-701 (strcat "Труба " str-01 " (медная)")
					str-702 "ГОСТ 617-90"
		);setq
	);if
	
	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   /////////////////////////////////////////////////////////////
(defun spcf-101-07-mtrl-pipe-imp-01

( / cntr-1 pnt-ins str-01 str-02 str-05 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
  (setvar "osmode" 6199)

	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
				
				str-unit "м"	
				str-manufact nil					
				str-crtf nil
				str-702 nil	
				
				pnt-ins (getpoint "\nУкажите точку вставки\n")		
	);setq

	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 8734" str-01)
		(setq str-701 "Труба стальная бесшовная холоднодеформированная"										
					str-order (list (cons 1 (strcat "Труба " str-02 " ГОСТ 8734-75, сталь " str-05))
									  			(cons 2 ","));list
		);setq
	);if

	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 617" str-01)
		(setq str-701 "Труба медная"					
					str-order (list (cons 1 (strcat "Труба " str-02 " ГОСТ 617-2006"))
									  			(cons 2 "У"));list
		);setq
	);if
	
  ;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 9941" str-01)
		(setq str-701 "Труба бесшовная холодно- и теплодеформированная из коррозионно-стойкой стали"
		      str-order (list (cons 1 (strcat "Труба " str-02 "-" str-05 " ГОСТ 9941-81")))
		);setq
	);if
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////



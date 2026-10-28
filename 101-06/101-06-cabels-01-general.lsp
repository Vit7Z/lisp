;/////// ************************************************************ ////////////////////////////////////////////////////////////
;/////// кабель                                                       ////////////////////////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////////////////////////
(defun c:101-06-cabels-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-07 
list-08 list-801 list-802 list-900 list-900-dscr list-900-menu list-901 list-902 str-01 str-02 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-06-cable-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			
      list-901 nil
      list-902 nil
      
      list-900-menu nil
      list-900-dscr nil
      
      str-01 "0"
      str-02 "0"
);setq

(txt-01-101-06-cabels-01-general str-01)

(txt-02-101-06-cabels-01-general str-02)
																				
(if (< (setq dcl-id (load_dialog "dia-101-06-cabels-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_06_01_general" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(set_tile \"txt-05\" str-01)"
  				"(txt-01-101-06-cabels-01-general str-01)"
  				"(setq str-02 \"0\")"			
  				"(txt-02-101-06-cabels-01-general str-02)"	
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-02 (get_tile \"txt-02\"))"
					"(txt-02-101-06-cabels-01-general str-02)"
  				"(set_tile \"txt-07\" str-02)"
  				"(set_tile \"txt-08\" str-02)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq str-03 (get_tile \"txt-03\"))"
  				"(set_tile \"txt-04\" str-03)"
  				"(set_tile \"txt-05\" str-03)"
  );srcat
);action_tile


(action_tile "but1"
  (strcat "(but1-101-06-cabels-01-general)");strcat
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

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(cond
	((= type-list "le") (le-101-06-cabels-01-general list-902));=
	((= type-list "spcf") (spcf-101-06-cabels-01-general list-902));=
	((= type-list "lecgv") (lecgv-101-06-cabels-01-general list-902));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// ************************************************************ ////////////////////////////////////////////////////////////
;/////// конец                                                        ////////////////////////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-06-cabels-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-900-menu name-file num-flds)

(setq name-file (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file num-flds)

(setq list-02 list-01-read-file
			list-803 list-02-read-file
			list-804 list-03-read-file
			list-07 list-04-read-file
			list-08 list-05-read-file
);setq

(set_tile "hm-31" (nth 0 list-900-menu))
(set_tile "hm-32" (nth 1 list-900-menu))
(set_tile "hm-33" (nth 2 list-900-menu))

(set_tile "hm-41" (nth 3 list-900-menu))
(set_tile "hm-42" (nth 4 list-900-menu))
(set_tile "hm-43" (nth 5 list-900-menu))

(set_tile "hm-51" (nth 6 list-900-menu))
(set_tile "hm-52" (nth 7 list-900-menu))
(set_tile "hm-53" (nth 8 list-900-menu))

(set_tile "hm-61" (nth 9 list-900-menu))
(set_tile "hm-62" (nth 10 list-900-menu))
(set_tile "hm-63" (nth 11 list-900-menu))

(list-filling "txt-02" list-02)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)

(set_tile "txt-02" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-06-cabels-01-general

(str-02 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-900-dscr list-900-read-file name-file num-flds str-03)

(setq name-file (nth (atoi str-02) list-803)
			num-flds (atoi (nth (atoi str-02) list-804))
			str-03 (get_tile "txt-01")
);setq

(read-file-for-dialog-box-01 name-file num-flds)

(if (/= list-900-dscr nil)
	(divide-text-into-parts list-900-dscr 200)
);

(setq list-03 list-01-read-file
			list-04 list-02-read-file
			list-05 list-03-read-file
			list-06 list-04-read-file
			list-900 list-900-read-file
);setq

(if (= str-03 nil)
	(setq str-03 (nth 0 list-01));setq
	(setq str-03 (nth (atoi str-03) list-01));setq
);if

(if (= str-03 "Проводник установочный (монтажный)")
	(setq list-06 (list "Белый" "Желто-зелен." "Красный" "Синий"));setq
);if

(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-900" list-900)

(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-06-cabels-01-general

( / str-01 str-02 str-02-lft str-02-new str-02-right str-03 str-04 str-05 str-06 str-07 str-08 tmp-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)

			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
);setq

(if (/= list-901 nil)
	(setq list-902 (reverse list-902)
				list-901 (reverse list-901)
	);setq
);if


;;;;;;;;собираем данные
(if (= str-01 "Кабель силовой")
	(progn
		(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-04 (strcat "наружн. диаметр " str-04 "мм")
					str-05 (nth (atoi (get_tile "txt-05")) list-05)		
		);setq
				
		(if (or (= str-02 "ВВГнг(А)-LS (U до 660В)")
						(= str-02 "ВВГнг(А)-LS (U до 1000В)")
						(= str-02 "ВВГЭнг-LS (U до 660В)"));or
						
			(setq str-02-lft (substr str-02 1 (- (vl-string-search "U" str-02) 2))
						str-02-right (substr str-02 (- (vl-string-search "U" str-02) 1));1 \\
						
						str-02-new (strcat str-02-lft " " str-03 str-02-right)
			);setq
		);if
				
		(setq list-901 (vl-list* str-02-new list-901)
					tmp-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-02-new) (cons 4 str-04) (cons 99 str-05) (cons 5 str-07) (cons 6 str-08))
		);setq
	);progn
);if


;;;;;;;;собираем данные
(if (or (= str-01 "Кабель контрольный")
				(= str-01 "Кабель для интерфейса RS-485")
				(= str-01 "Кабель для IP-сетей (Ethernet)")
				(= str-01 "Кабель радиочастотный"))
				
	(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)				
				str-04 (strcat "наружн. диаметр " str-04 "мм")
				str-05 (nth (atoi (get_tile "txt-05")) list-05)
	
				list-901 (vl-list* (strcat str-02 " " str-03) list-901)
				tmp-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 (strcat str-02 " " str-03)) (cons 4 str-04) (cons 99 str-05) (cons 5 str-07) (cons 6 str-08))
	);setq
);if

;;;;;;;;собираем данные
(if (= str-01 "Проводник установочный (монтажный)")
	(progn
		(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-04 (strcat "наружн. диаметр " str-04 "мм")
					str-05 (nth (atoi (get_tile "txt-05")) list-05)
					str-06 (nth (atoi (get_tile "txt-06")) list-06)
					
					list-901 (vl-list* (strcat str-02 " " str-03 " " str-06) list-901)
		);setq
	
		(cond
			((= str-06 "Белый") (setq str-06 "белый"));
			((= str-06 "Желто-зелен.") (setq str-06 "желто-зеленый"));
			((= str-06 "Синий") (setq str-06 "синий"));
		);if
	
		(setq tmp-902 (list (cons 1 "Проводник установочный") (cons 2 str-02) (cons 3 (strcat str-02 " " str-03)) (cons 4 str-04) (cons 99 str-05) (cons 5 str-07) (cons 6 str-08) (cons 7 str-06)));setq
	);progn
);if

;;;;;;;;собираем данные
(if (= str-01 "Проводник заземляющий")
	(setq str-05 (nth (atoi (get_tile "txt-05")) list-05)
	
				list-901 (vl-list* str-03 list-901)
				tmp-902 (list (cons 1 str-01) (cons 3 str-03) (cons 4 (strcat "длина " str-04 "мм")) (cons 99 str-05) (cons 5 str-07) (cons 6 str-08))
	);setq
);if

;(princ "\n         tmp-902 = ") (princ tmp-902);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV


(setq list-902 (vl-list* tmp-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   ///////////////////////////////////////////////////////////////////////////////////
(defun le-101-06-cabels-01-general

(list-902 / cntr-1 pnt-ins str-01 str-03 str-04 str-07 str-701 str-702 str-tmp)

(setq cntr-1 0
			str-702 "Кол. в метрах"
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))	
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))			
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;/////////////////////////////////////////////////////////////
	(if (or (= str-01 "Кабель силовой")
					(= str-01 "Кабель контрольный")
					(= str-01 "Кабель для интерфейса RS-485")
					(= str-01 "Кабель для IP-сетей (Ethernet)")
					(= str-01 "Кабель радиочастотный"))
				
		(setq str-701 (strcat str-01 " " str-03 ", " str-04));setq
	);if

	;;;;;;;/////////////////////////////////////////////////////////////
	(if (= str-01 "Проводник установочный")
				
		(setq str-07 (cdr (assoc 7 str-tmp))
										
					str-701 (strcat str-01 " " str-03 ", " str-04 ", " str-07)
		);setq
	);if


	;;;;;;;/////////////////////////////////////////////////////////////
	(if (= str-01 "Проводник заземляющий")
				
		(setq str-701 (strcat str-01 " " str-03 ", " str-04)
					
					str-702 nil
		);setq
	);if


	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   /////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-06-cabels-01-general

(list-902 / cntr-1 pnt-ins str-01 str-01-mdf str-02 str-03 str-04 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0
			str-unit "м"
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
		
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;/////////////////////////////////////////////////////////////
	(if (or (= str-01 "Кабель силовой")
					(= str-01 "Кабель контрольный")
					(= str-01 "Кабель для интерфейса RS-485")
					(= str-01 "Кабель для IP-сетей (Ethernet)")
					(= str-01 "Кабель монтажный")
					(= str-01 "Кабель контрольный")
					(= str-01 "Проводник установочный"))
					
		(setq str-701 str-01
				
					str-702 (list (cons 1 (strcat "сертификат " str-06))
									);list
											 
					str-order (list (cons 1 (strcat str-03)) 
													(cons 2 ",") 
													(cons 3 nil));list
		);setq
	);if
	
	;;;;;;;/////////////////////////////////////////////////////////////
	(if (= str-01 "Проводник заземляющий")
					
		(setq str-701 str-01
				
					str-702 (list (cons 1 str-04));list
					
					str-unit "шт."
					
					str-order (list (cons 1 (strcat str-03)) 
													(cons 2 ",") 
													(cons 3 nil));list
		);setq
	);if


	(setq str-manufact str-05
				str-crtf nil
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins) 
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               //////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-06-cabels-01-general

(list-902 / cntr-1 pnt-ins str-01 str-03 str-04 str-07 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;/////////////////////////////////////////////////////////////
	(if (= str-01 "Проводник установочный")
				
		(setq str-701 (strcat str-01 " " str-03 ", " str-04 ", " str-07)
					str-702 nil
					str-703 nil
		);setq
	);if

	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
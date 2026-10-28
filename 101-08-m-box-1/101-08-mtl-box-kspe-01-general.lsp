;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-mtl-box-kspe-01-general

( / adoc dcl-id list-01 list-01-read-file list-02-read-file list-05 list-06 list-07 list-21 list-22 list-23 list-24 list-801 list-900 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-08-mtl-box-kspe-01-general.txt" 2)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			
      list-901 nil
      list-902 nil
      list-900 nil
      
      str-01 "0"
);setq

(txt-01-101-08-mtl-box-kspe-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-08-mtl-box-kspe-01-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_08_mtl_box_kspe" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-21" list-21)
(list-filling "txt-22" list-22)
(list-filling "txt-23" list-23)
(list-filling "txt-24" list-24)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-21" "0")
(set_tile "txt-22" "0")
(set_tile "txt-23" "0")
(set_tile "txt-24" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(txt-01-101-08-mtl-box-kspe-01-general str-01)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-08-mtl-box-kspe-01-general)");srcat
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

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (le-101-08-mtl-box-kspe-01-general list-902));if

(if (= type-list "spcf") (spcf-101-08-mtl-box-kspe-01-general list-902));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма для txt-01//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-08-mtl-box-kspe-01-general

(str-01 / list-900 list-900-dscr list-900-read-file list-902-read-file name-file-1)

(setq name-file-1 (nth (atoi str-01) list-801));setq

(read-file-for-dialog-box-02 name-file-1)

(divide-text-into-parts list-900-dscr 120)

(setq list-21 (cdr (nth 0 list-902-read-file))
			list-22 (cdr (nth 1 list-902-read-file))
			list-23 (cdr (nth 2 list-902-read-file))
			list-24 (cdr (nth 3 list-902-read-file))
			
			list-05 (cdr (nth 4 list-902-read-file))
			list-06 (cdr (nth 5 list-902-read-file))
			list-07 (cdr (nth 6 list-902-read-file))
			list-99 (cdr (nth 7 list-902-read-file))
			list-900 list-900-read-file
);setq

(list-filling "txt-21" list-21)
(list-filling "txt-22" list-22)
(list-filling "txt-23" list-23)
(list-filling "txt-24" list-24)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-21" "0")
(set_tile "txt-22" "0")
(set_tile "txt-23" "0")
(set_tile "txt-24" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных//////////////////////////////////////////////////////////////////////////
(defun but1-101-08-mtl-box-kspe-01-general

( / str-01 str-05 str-06 str-07 str-21 str-21-901 str-21-type str-22 str-22-901 str-22-type str-23 str-23-901 
str-23-type str-24 str-24-901 str-24-type str-99 str-glands tmp-list-902)

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-21 (nth (atoi (get_tile "txt-21")) list-21)
			str-22 (nth (atoi (get_tile "txt-22")) list-22)
			str-23 (nth (atoi (get_tile "txt-23")) list-23)
			str-24 (nth (atoi (get_tile "txt-24")) list-24)

			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(if (/= str-21 0)
	(setq str-21-901 (strcat "М20 - " str-21 "шт.")
				str-21-type "сальник М20 (диам. кабеля 6...12 мм)"
	);set
);if

(if (/= str-22 0)
	(setq str-22-901 (strcat "М25 - " str-22 "шт.")
				str-22-type "сальник М25 (диам. кабеля 13...18 мм)"
	);set
);if

(if (/= str-23 0)
	(setq str-23-901 (strcat "М32 - " str-23 "шт.")
				str-23-type "сальник М32 (диам. кабеля 14...25 мм)"
	);set
);if

(if (/= str-24 0)
	(setq str-24-901 (strcat "М40 - " str-24 "шт.")
				str-24-type "сальник М40 (диам. кабеля 22...30 мм)"
	);set
);if

;///////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "КСП-10е(i)")
  (progn
    (if (and (= str-21 "0") (= str-22 "0"))
      (setq str-glands "Без сальников!");setq
      
      (setq str-glands (strcat "Сальники " str-21-901 "  " str-22-901));setq
    );if
  
    (setq tmp-list-902 (list (cons 31 str-21-type) (cons 32 str-21)
			                       (cons 33 str-22-type) (cons 34 str-22)) 
	  );setq
	);progn
);if

;///////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "КСП-25е(i)")
  (progn
    (if (and (= str-21 "0") (= str-22 "0") (= str-23 "0"))
      (setq str-glands "Без сальников!");setq
      
      (setq str-glands (strcat "Сальники " str-21-901 "  " str-22-901 "  " str-23-901));setq
    );if

		(setq tmp-list-902 (list (cons 31 str-21-type) (cons 32 str-21)
														 (cons 33 str-22-type) (cons 34 str-22)
														 (cons 35 str-23-type) (cons 36 str-23)) 
		);setq
  );progn
);if

;///////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "КСП-45е(i)")
  (progn
    (if (and (= str-21 "0") (= str-22 "0") (= str-23 "0") (= str-24 "0"))
      (setq str-glands "Без сальников!");setq
      
      (setq str-glands (strcat "Сальники " str-21-901 "  " str-22-901 "  " str-23-901 "  " str-24-901));setq
    );if

		(setq tmp-list-902 (list (cons 31 str-21-type) (cons 32 str-21)
														 (cons 33 str-22-type) (cons 34 str-22)
														 (cons 35 str-23-type) (cons 36 str-23)
			                       (cons 37 str-24-type) (cons 38 str-24))  
		);setq
  );progn
);if

(setq list-901 (vl-list* (strcat str-01 "  Клемм " str-05 "шт.  " str-glands) list-901)
      
      tmp-list-902 (append (list (cons 1 str-01) (cons 2 str-05) (cons 3 str-06) 
                                 (cons 9 (strcat "маркировка взрывозащиты " str-07))
                                 (cons 99 str-99));list
                                 tmp-list-902);append
);setq

(setq list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;; вывод в ПЭ                                ///////////////////////////////////////////////////////////////
(defun le-101-08-mtl-box-kspe-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-09 str-31 str-32 str-33 str-34 str-36 str-38 str-701 
str-702 str-add str-add-tmp str-tmp xpnt-ins ypnt-ins)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))	
				str-09 (cdr (assoc 9 str-tmp))
				str-32 (cdr (assoc 32 str-tmp))
				str-34 (cdr (assoc 34 str-tmp))
				str-702 nil
	);setq

	;///////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "КСП-10е(i)")
		(progn
			(if (and (= str-32 "0") (= str-34 "0"))
				(progn
					(alert "Без сальников!!!")
					(setq str-add "без сальников");setq
				);progn
				
				(setq str-add "в комплекте c:");setq
			);if
		
			(if (/= str-32 "0")
				(setq str-31 (cdr (assoc 31 str-tmp))
							str-add-tmp (strcat str-31 " " str-32 "шт.")
							str-add (strcat str-add " " str-add-tmp)
				);setq
			);if
			
			(if (/= str-34 "0")
				(progn
					(setq str-33 (cdr (assoc 33 str-tmp))
								str-add-tmp (strcat str-33 " " str-34 "шт.")
					);setq
					
					(if (/= str-32 "0")
						(setq str-add (strcat str-add ", " str-add-tmp));setq
						(setq str-add (strcat str-add " " str-add-tmp));setq
					);if
				 );progn
			);if
		);progn
	);if
	
	
	;///////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "КСП-25е(i)")
		(progn
		  (setq str-36 (cdr (assoc 36 str-tmp)));setq
		  
			(if (and (= str-32 "0") (= str-34 "0") (= str-36 "0"))
				(progn
					(alert "Без сальников!!!")
					(setq str-add "без сальников");setq
				);progn
				
				(setq str-add "в комплекте c:");setq
			);if
		
			(if (/= str-32 "0")
				(setq str-31 (cdr (assoc 31 str-tmp))
							str-add-tmp (strcat str-31 " " str-32 "шт.")
							str-add (strcat str-add " " str-add-tmp)
				);setq
			);if
			
			(if (/= str-34 "0")
				(progn
				  (setq str-33 (cdr (assoc 33 str-tmp))
								str-add-tmp (strcat str-33 " " str-34 "шт.")
					);setq
					
					(if (/= str-32 "0")
						(setq str-add (strcat str-add ", " str-add-tmp));setq
						(setq str-add (strcat str-add " " str-add-tmp));setq
					);if
				);progn
			);if

			(if (/= str-36 "0")
				(progn
				  (setq str-35 (cdr (assoc 35 str-tmp))
								str-add-tmp (strcat str-35 " " str-36 "шт.")
					);setq
					
					(if (or (/= str-32 "0") (/= str-34 "0"))
						(setq str-add (strcat str-add ", " str-add-tmp));setq
						(setq str-add (strcat str-add " " str-add-tmp));setq
					);if
				);progn
			);if
		);progn
	);if
	
	;///////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "КСП-45е(i)")
		(progn
		  (setq str-36 (cdr (assoc 36 str-tmp))
		        str-38 (cdr (assoc 38 str-tmp))
		  );setq
		  
			(if (and (= str-32 "0") (= str-34 "0") (= str-36 "0") (= str-38 "0"))
				(progn
					(alert "Без сальников!!!")
					(setq str-add "без сальников");setq
				);progn
				
				(setq str-add "в комплекте c:");setq
			);if
		
			(if (/= str-32 "0")
				(setq str-31 (cdr (assoc 31 str-tmp))
							str-add-tmp (strcat str-31 " " str-32 "шт.")
							str-add (strcat str-add " " str-add-tmp)
				);setq
			);if
			
			(if (/= str-34 "0")
				(progn
				  (setq str-33 (cdr (assoc 33 str-tmp))
								str-add-tmp (strcat str-33 " " str-34 "шт.")
					);setq
					
					(if (/= str-32 "0")
						(setq str-add (strcat str-add ", " str-add-tmp));setq
						(setq str-add (strcat str-add " " str-add-tmp));setq
					);if
				);progn
			);if

			(if (/= str-36 "0")
				(progn
				  (setq str-35 (cdr (assoc 35 str-tmp))
								str-add-tmp (strcat str-35 " " str-36 "шт.")
					);setq
					
					(if (or (/= str-32 "0") (/= str-34 "0"))
						(setq str-add (strcat str-add ", " str-add-tmp));setq
						(setq str-add (strcat str-add " " str-add-tmp));setq
					);if
				);progn
			);if
			
			
			(if (/= str-38 "0")
				(progn
				  (setq str-37 (cdr (assoc 37 str-tmp))
								str-add-tmp (strcat str-37 " " str-38 "шт.")
					);setq
					
					(if (or (/= str-32 "0") (/= str-34 "0") (/= str-36 "0"))
						(setq str-add (strcat str-add ", " str-add-tmp));setq
						(setq str-add (strcat str-add " " str-add-tmp));setq
					);if
				);progn
			);if
		);progn
	);if
	

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(setvar "osmode" 0)
	
	(setq str-701 (strcat "Коробка соединительная " str-01 ", " str-02 " клемм, " str-03 ", " str-09 ", " str-add));setq
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////



;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в СПЦФ                 ///////////////////////////////////////////////////////////////
(defun spcf-101-08-mtl-box-kspe-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-09 str-31 str-32 str-33 str-34 str-35 str-36 str-37 
str-38 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				
				str-03 (cdr (assoc 3 str-tmp))
				str-03 (strcat "степень защиты " str-03 " по ГОСТ 14254")
				
				str-31 (cdr (assoc 31 str-tmp))
				str-32 (cdr (assoc 32 str-tmp))
				str-33 (cdr (assoc 33 str-tmp))
				str-34 (cdr (assoc 34 str-tmp))
				str-35 (cdr (assoc 35 str-tmp))
				str-36 (cdr (assoc 36 str-tmp))
				str-37 (cdr (assoc 37 str-tmp))
				str-38 (cdr (assoc 38 str-tmp))
				str-09 (cdr (assoc 9 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
				
				str-701 "Коробка соединительная"
				
				str-702 (list (cons 1 (strcat "кол. клемм " str-02))
											(cons 2 "клеммник наборный")
											(cons 3 str-03)
											(cons 4 str-09)
								);list
	);setq
	
	;;;;;;;/////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "КСП-10е(i)")
		(progn
		  (if (and (= str-32 "0") (= str-34 "0"))
		    (setq str-tmp (list (cons 5 "без сальников")))		
		    (setq str-tmp (list (cons 5 "сальники металлические, расположение сальников произвольное")));setq
	    );if
	    
	    (setq str-702 (append str-702 str-tmp));setq
		
			(if (/= str-32 "0")
				(setq str-tmp (list (cons 6 (strcat str-31 " " str-32 "шт.")))
							str-702 (append str-702 str-tmp)
				);setq
			);if

			(if (/= str-34 "0")
				(setq str-tmp (list (cons 7 (strcat str-33 " " str-34 "шт.")))
							str-702 (append str-702 str-tmp)
				);setq
			);if
		);progn
	);if

	;;;;;;;/////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "КСП-25е(i)")
		(progn
		  (if (and (= str-32 "0") (= str-34 "0") (= str-36 "0"))
		    (setq str-tmp (list (cons 5 "без сальников")))		
		    (setq str-tmp (list (cons 5 "сальники металлические, расположение сальников произвольное")));setq
	    );if
	    
	    (setq str-702 (append str-702 str-tmp));setq
	    
			(if (/= str-32 "0")
				(setq str-tmp (list (cons 6 (strcat str-31 " " str-32 "шт.")))
							str-702 (append str-702 str-tmp)
				);setq
			);if

			(if (/= str-34 "0")
				(setq str-tmp (list (cons 7 (strcat str-33 " " str-34 "шт.")))
							str-702 (append str-702 str-tmp)
				);setq
			);if

			(if (/= str-36 "0")
				(setq str-tmp (list (cons 8 (strcat str-35 " " str-36 "шт.")))
							str-702 (append str-702 str-tmp)
				);setq
			);if
		);progn
	);if

	;;;;;;;/////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "КСП-45е(i)")
		(progn
		  (if (and (= str-32 "0") (= str-34 "0") (= str-36 "0") (= str-38 "0"))
		    (setq str-tmp (list (cons 5 "без сальников")))		
		    (setq str-tmp (list (cons 5 "сальники металлические, расположение сальников произвольное")));setq
	    );if
	    
	    (setq str-702 (append str-702 str-tmp));setq

			(if (/= str-32 "0")
				(setq str-tmp (list (cons 6 (strcat str-31 " " str-32 "шт.")))
							str-702 (append str-702 str-tmp)
				);setq
			);if

			(if (/= str-34 "0")
				(setq str-tmp (list (cons 7 (strcat str-33 " " str-34 "шт.")))
							str-702 (append str-702 str-tmp)
				);setq
			);if

			(if (/= str-36 "0")
				(setq str-tmp (list (cons 8 (strcat str-35 " " str-36 "шт.")))
							str-702 (append str-702 str-tmp)
				);setq
			);if

			(if (/= str-38 "0")
				(setq str-tmp (list (cons 9 (strcat str-37 " " str-38 "шт.")))
							str-702 (append str-702 str-tmp)
				);setq
			);if
		);progn
	);if

	(setvar "osmode" 6199)

	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")	
				
				str-order (list (cons 1 str-01) 
												(cons 2 nil) 
												(cons 3 nil)
									);list
	
				str-manufact "ОАО \"ЛОЗ-СЗМА\", г. Санкт-Петербург"
				str-unit "компл."
				str-crtf nil
	);setq
	
	(setvar "osmode" 0)
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat
	

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

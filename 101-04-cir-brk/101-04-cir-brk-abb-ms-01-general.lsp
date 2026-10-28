;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-cir-brk-abb-ms-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-801 list-802 list-900 list-900-descr 
list-900-header list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-04-cir-brk-abb-ms-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			
      list-901 nil
      list-902 nil
      list-900 nil
      list-900-menu nil
      list-900-dscr nil
      
      str-01 "0"
);setq

(txt-01-101-04-cir-brk-abb-ms-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-04-cir-brk-abb-ms-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_auto_abb_series_ms" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(txt-01-101-04-cir-brk-abb-ms-01-general str-01)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-txt (get_tile \"txt-02\"))"
  				"(set_tile \"txt-03\" str-txt)"
  				"(set_tile \"txt-04\" str-txt)"
  				"(set_tile \"txt-05\" str-txt)"
  				"(set_tile \"txt-06\" str-txt)"
  				"(set_tile \"txt-99\" str-txt)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq str-txt (get_tile \"txt-03\"))"
  				"(set_tile \"txt-02\" str-txt)"
  				"(set_tile \"txt-04\" str-txt)"
  				"(set_tile \"txt-05\" str-txt)"
  				"(set_tile \"txt-06\" str-txt)"
  				"(set_tile \"txt-99\" str-txt)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(setq str-txt (get_tile \"txt-04\"))"
  				"(set_tile \"txt-02\" str-txt)"
  				"(set_tile \"txt-03\" str-txt)"
  				"(set_tile \"txt-05\" str-txt)"
  				"(set_tile \"txt-06\" str-txt)"
  				"(set_tile \"txt-99\" str-txt)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(setq str-txt (get_tile \"txt-05\"))"
  				"(set_tile \"txt-02\" str-txt)"
  				"(set_tile \"txt-03\" str-txt)"
  				"(set_tile \"txt-04\" str-txt)"
  				"(set_tile \"txt-06\" str-txt)"
  				"(set_tile \"txt-99\" str-txt)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-04-cir-brk-abb-ms-01-general)");strcat
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
	((= type-list "le") (le-101-04-cir-brk-abb-ms-01-general list-902));=
	((= type-list "spcf") (spcf-101-04-cir-brk-abb-ms-01-general list-902));=
	((= type-list "lecgv") (lecgv-101-04-cir-brk-abb-ms-01-general list-902));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-04-cir-brk-abb-ms-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-900-dscr list-900-menu name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

(set_tile "ptxt-41" (nth 0 list-900-menu))
(set_tile "ptxt-42" (nth 1 list-900-menu))

(set_tile "ptxt-51" (nth 2 list-900-menu))
(set_tile "ptxt-52" (nth 3 list-900-menu))

(set_tile "ptxt-61" (nth 4 list-900-menu))
(set_tile "ptxt-62" (nth 5 list-900-menu))

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-99 list-06-read-file
			list-900 list-900-dscr
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-04-cir-brk-abb-ms-01-general

( / cntr-1 str-01 str-02 str-03 str-04 str-05 str-06 str-99 tmp-list-902)

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
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

;;;;;;;//////////////////////////////////////////////////////////////////////
(if (or (= str-01 "MS 116") (= str-01 "MS 132") (= str-01 "MS 165") (= str-01 "MS 450"));
	(setq list-901 (vl-list* (strcat str-02 "  " str-04  "А  " str-05 "кВт") list-901)
			
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-06) (cons 99 str-99))
	);setq
);if

;;;;;;;//////////////////////////////////////////////////////////////////////
(if (= str-01 "Доп. контакты MS 116, MS 132")
	(setq list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-04  "  " str-05 "") list-901)
			
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 99 str-99))					
	);setq
);if

(setq list-902 (vl-list* tmp-list-902 list-902)
			list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-cir-brk-abb-ms-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-01 "MS 116") (= str-01 "MS 132") (= str-01 "MS 165") (= str-01 "MS 450"));
		(progn	
			(cond
				((= str-05 "Винтовой") (setq str-05 "винтовые"));=
			);cond
			(setq str-701 (strcat "Выключатель автоматический ABB " str-02 ", артикул " str-03 ", диапазон теплового расцепителя " str-04 "А, " str-05 " контакты")
						str-702 nil
			);setq
		);progn
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Доп. контакты MS 116, MS 132")
		(progn
			(setq str-05 (strcase str-05 1));setq

			(cond
				((= str-06 "Винтовой") (setq str-06 "винтовые"));=
			);cond
			
			(setq str-701 (strcat "Контакт вспомогательный ABB (для MS116/MS132) " str-02 ", артикул " str-03 ", контакты " str-04 ", монтаж " str-05 ", " str-06 " контакты")
						str-702 nil
			);setq
		);progn
	);if

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**2**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-04-cir-brk-abb-ms-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-700 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

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

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-01 "MS 116") (= str-01 "MS 132") (= str-01 "MS 450"));
		(progn
			(setq str-06 (cdr (assoc 6 str-tmp)));setq
			
			(cond
				((= str-05 "Винтовой") (setq str-05 "винтовые"));=
		
			);cond

			(setq str-701 "Выключатель автоматический (для защиты эл. двигателя)"
			
						str-702 (list (cons 1 (strcat "диапазон теплового расцепителя " str-04 "А"))
													(cons 2 (strcat str-05 " контакты")));list
											 
						str-order (list (cons 1 (strcat str-02 ", код заказа " str-03)) 
														(cons 2 ",") 
														(cons 3 nil));list
					
						str-unit "шт."						
			);setq
		);progn
	);if
	
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Доп. контакты MS 116, MS 132")
		(progn
			(setq str-05 (strcase str-05 1)
						str-06 (cdr (assoc 6 str-tmp))
			);setq

			(cond
				((= str-06 "Винтовой") (setq str-06 "винтовые"));=
		
			);cond
  		
			(setq str-701 "Контакт вспомогательный"
			
						str-702 (list (cons 1 "для авт. выключателей MS116/MS132")
													(cons 2 (strcat "контакты " str-04))
													(cons 3 (strcat "монтаж на выкючатель " str-05))
													(cons 4 (strcat str-06 " контакты")));list
											 
						str-order (list (cons 1 (strcat str-02 ", код заказа " str-03)) 
														(cons 2 ",") 
														(cons 3 nil));list
					
						str-unit "шт."						
			);setq
		);progn
	);if
	
	(setq str-manufact "ABB"
				str-crtf nil
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins)
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-cir-brk-abb-ms-01-general

(list-902 / cntr-1 dlt-y pnt-ins str-01 str-02 str-03 str-04 str-05 str-99 str-tmp str-txt x-pnt-ins y-pnt-ins)

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
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-01 "MS 116") (= str-01 "MS 132") (= str-01 "MS 450"));
		(progn
			(cond
				((= str-05 "Винтовой") (setq str-05 "винтовые"));=
			);cond
			
			(setq str-txt (strcat "Выключатель автоматический ABB, " str-02 ", код заказа " str-03 ", диапазон тепл. расцепителя " str-04 "А, " str-05 " контакты"));setq
		);progn
	);if

	(split-str-parts-lecgv-065-01 str-txt nil nil str-99 pnt-ins);
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-auto-swtch-iek

( / adoc dcl-id list-01 list-01-read-file list-02 list-03 list-04 list-05 list-901 list-902 str-01 type-list)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box "101-el-dev-iek-va4729-general-01.txt" 3)

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

(setq list-01 list-01-read-file
			list-02 (list "1" "2" "3" "4")
			
			str-01 nil
			
      list-901 nil
      list-902 nil
);setq

(txt-01-101-04-auto-swtch-iek)

(if (< (setq dcl-id (load_dialog "dia-101-04-auto-swtch-iek.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_04_auto_swtch_iek" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")


(action_tile "txt-01"
  (strcat "(txt-01-101-04-auto-swtch-iek)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(txt-01-101-04-auto-swtch-iek)");srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq str-03 (get_tile \"txt-03\"))"
;  				"(list-filling \"txt-04\" list-04)"
  				"(set_tile \"txt-04\" str-03)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-04-auto-swtch-iek)"
  			 	"(list-filling \"txt-01\" list-01)"
  			 	"(list-filling \"txt-02\" list-02)"
			 		"(list-filling \"txt-03\" list-03)"
			 		"(list-filling \"txt-04\" list-04)"
			 		"(set_tile \"txt-01\" \"0\")"
			 		"(set_tile \"txt-02\" \"0\")"
          "(set_tile \"txt-03\" \"0\")"
          "(set_tile \"txt-04\" \"0\")"
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

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(cond
	((= type-list "le") (le-101-04-auto-swtch-iek));=
	((= type-list "spcf") (spcf-101-04-auto-swtch-iek));=
	((= type-list "lecgv") (lecgv-101-04-auto-swtch-iek));=
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
(defun txt-01-101-04-auto-swtch-iek

( / file-name list-01-read-file list-02-read-file)

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01)
				str-02 (nth 0 list-02)
	);setq
	
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
				str-02 (nth (atoi (get_tile "txt-02")) list-02)
	);setq
);if

(if (= str-01 "ВА47-29, характеристика B")
	(cond
		((= str-02 "1") (setq file-name "101-el-dev-iek-va4729-b-1.txt")); =
		((= str-02 "2") (setq file-name "101-el-dev-iek-va4729-b-2.txt")); =
		((= str-02 "3") (setq file-name "101-el-dev-iek-va4729-b-3.txt")); =
		((= str-02 "4") (setq file-name "101-el-dev-iek-va4729-b-4.txt")); =
	); cond
);if

(if (= str-01 "ВА47-29, характеристика С")
	(cond
		((= str-02 "1") (setq file-name "101-el-dev-iek-va4729-c-1.txt")); =
		((= str-02 "2") (setq file-name "101-el-dev-iek-va4729-c-2.txt")); =
		((= str-02 "3") (setq file-name "101-el-dev-iek-va4729-c-3.txt")); =
		((= str-02 "4") (setq file-name "101-el-dev-iek-va4729-c-4.txt")); =
	); cond
);if

(if (= str-01 "ВА47-29, характеристика D")
	(cond
		((= str-02 "1") (setq file-name "101-el-dev-iek-va4729-d-1.txt")); =
		((= str-02 "2") (setq file-name "101-el-dev-iek-va4729-d-2.txt")); =
		((= str-02 "3") (setq file-name "101-el-dev-iek-va4729-d-3.txt")); =
		((= str-02 "4") (setq file-name "101-el-dev-iek-va4729-d-4.txt")); =
	); cond
);if


(read-file-for-dialog-box file-name 2)

(setq list-03 list-01-read-file
			list-04 list-02-read-file
);setq

(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)

(set_tile "txt-03" "0")
(set_tile "txt-04" "0")

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-04-auto-swtch-iek

( / str-01 str-01-01 str-01-02 str-01-03 str-02 str-03 str-04 str-99 tmp-list-902)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
      str-02 (nth (atoi (get_tile "txt-02")) list-02)
      str-03 (nth (atoi (get_tile "txt-03")) list-03)
      str-04 (nth (atoi (get_tile "txt-04")) list-04)
);setq

(setq str-01-01 (substr str-01 1 (vl-string-search "," str-01))
			str-01-02 (substr str-01 (+ (vl-string-search "," str-01) 3))
			str-01-03 (vl-string-subst "х-ка" "характеристика" str-01-02)

			str-01 (strcat str-01-01 " " str-02 "P " str-03 "А " str-01-03)
);setq

(cond
	((= "1" str-02) (setq str-99 "0,22"));
	((= "2" str-02) (setq str-99 "0,25"));
	((= "3" str-02) (setq str-99 "0,38"));
);cond


(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq list-901 (vl-list* (strcat str-01 "  полюсов " str-02 "  Iном " str-03  "А  артикул " str-04) list-901)
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-01-03) (cons 99 str-99))
);setq
	
(setq list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-auto-swtch-iek

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
				str-701 (strcat "Выключатель автоматический IEK, " str-01 ", артикул " str-04 ", полюсов " str-02 ", Iном " str-03 "А")
				str-702 nil
	);setq
			
	(split-str-parts-le-01-general str-701 str-702 pnt-ins);
  
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-04-auto-swtch-iek

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-05 (vl-string-subst "характеристика" "х-ка" str-05)
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
	
				str-701 "Выключатель автоматический"
						
				str-702 (list (cons 1 (strcat "кол. полюсов " str-02 ", Iном " str-03 "А"))
											(cons 2 str-05));list
																	 
				str-order (list (cons 1 (strcat str-01 ", артикул " str-04)) 
												(cons 2 ",") 
												(cons 3 nil));list

				str-manufact "IEK, г. Москва"
				str-unit "шт."
	
				str-crtf nil
	);setq
			
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-auto-swtch-iek

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-05 (vl-string-subst "характеристика" "х-ка" str-05)
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)

	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
				str-701 (strcat "Выключатель автоматический IEK, " str-01 ", артикул " str-04 ", полюсов " str-02 ", Iном " str-03 "А, " str-05)
				str-702 nil
				str-703 nil
	);setq

	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
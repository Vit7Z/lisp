;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////
;/////// выбор ссылочных и прилагаемых документов, са                 /////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:02-reference-doc-01-ins-documents

( / adoc counter dcl-id lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 lin-7 list-01 list-02 list-03 list-901 list-902 str-01 type-action)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

;устанавливаем системные переменные
(setvar	"CMDECHO" 0)

(setq list-01 (list "Правила, законы" "СНИП, СП" "ГОСТ" "РД и другое" "Руководства");
      list-901 nil
      list-902 nil

			counter 0
      
      str-01 nil
);setq

(txt-01-02-reference-doc-01)

(if (< (setq dcl-id (load_dialog "dia-02-reference-doc-01-ins-documents.dcl")) 0);формируем окно диалога
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_02_reference_doc_01_ins_documents" dcl-id)) 
			(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")

(action_tile "txt-01"
  (strcat "(txt-01-02-reference-doc-01)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-01 (get_tile \"txt-02\"))"
  				"(list-filling \"txt-03\" list-03)"
  				"(list-filling \"txt-03\" list-03)"
  				"(set_tile \"txt-03\" str-01)" 				
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq str-01 (get_tile \"txt-03\"))"
  				"(list-filling \"txt-02\" list-02)"
  				"(list-filling \"txt-02\" list-02)"
  				"(set_tile \"txt-02\" str-01)"				
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-02-reference-doc-01)");srcat
);action_tile

(action_tile "but2"
  (strcat "(setq type-action \"print-all\")"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-action \"print-text\")"
  				"(done_dialog)"
  );srcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(cond
	((= type-action "print-all") (but2-02-reference-doc-01));=
	((= type-action "print-text") (but3-02-reference-doc-01));=
);cond


(vla-endundomark adoc)
(setvar "CMDECHO" 1)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(princ)
)
;/////// *************************************************************/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-02-reference-doc-01

( / file-name list-01-read-file list-02-read-file)

(cond
	((= nil str-01) (setq str-01 "Правила, законы"));=
	((/= nil str-01) (setq str-01 (nth (atoi (get_tile "txt-01")) list-01)));=
);cond

(cond
	((= str-01 "Правила, законы") (setq file-name "02-reference-doc-01-rules.txt"));=
	((= str-01 "СНИП, СП") (setq file-name "02-reference-doc-01-snip.txt"));=
	((= str-01 "ГОСТ") (setq file-name "02-reference-doc-01-gost.txt"));=
	((= str-01 "РД и другое") (setq file-name "02-reference-doc-01-rd.txt"));=
	((= str-01 "Руководства") (setq file-name "02-reference-doc-01-re.txt"));=
);cond

(read-file-for-dialog-box-01 file-name 2)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-02-reference-doc-01

( / cntr-1 str-02 swtch tmp-list-902 tmp-str-02 tmp-str-03)

(setq cntr-1 0
			swtch list-901
);setq

(setq str-02 (get_tile "txt-02")
			str-02 (strcat "(" str-02 ")");преобразуем строку в список
			str-02 (read str-02)
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(repeat (length str-02)
  (setq tmp-str-02 (nth (nth cntr-1 str-02) list-02); для поля "выбрано"
  			tmp-str-03 (nth (nth cntr-1 str-02) list-03)
  			list-901 (vl-list* (strcat tmp-str-02 "  " tmp-str-03) list-901)
  );setq
	
	(setq tmp-list-902 (list (cons 1 tmp-str-02) (cons 2 tmp-str-03))
				list-902 (vl-list*  tmp-list-902 list-902)
	);setq
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(list-filling "txt-901" (reverse list-901))

(setq list-902 (reverse list-902))

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but2-02-reference-doc-01

( / box-txt counter data-crnt-obj data-obj data-obj-erase len-txt-l len-txt-r list-txt pnt-1 pos pos-blank str-doc str-doc-r txt txt-cut txt-doc-l txt-doc-r txt-l xpnt-1 ypnt-1 ypnt-2)

(setq counter 0);setq

(setq pnt-1 (getpoint "\nУкажите точку вставки\n")
		  xpnt-1 (nth 0 pnt-1)
		  ypnt-1 (nth 1 pnt-1)
			ypnt-2 (- (nth 1 pnt-1) 4);для текста
);setq
		
(setvar	"OSMODE" 0)

(repeat (length list-902)
	(setq str-doc (nth counter list-902);извлекаем строку с записью документа из списка документов из файла list-1
				pos (cdr (assoc 1 str-doc))
				str-doc-r (cdr (assoc 2 str-doc))				
	);setq
	
	
	(if (/= pos "Нет");рисуем обозначение документов
		(setq txt-doc-l
			(entmakex
				(list
					'(0 . "TEXT")
					'(100 . "AcDbEntity")
					'(100 . "AcDbText")
					 (cons 10 (list (- xpnt-1 30) ypnt-2)) ; нач точка текста
					 (cons 11 (list (- xpnt-1 30) ypnt-2)) ; нач точка текста
					 (cons 1 pos) ; содержание текста
					'(40 . 2.5) ; высота текста
					'(41 . 1) ; растяжение текста
					'(50 . 0) ; поворот текста
					'(72 . 1) ; гориз выравнивание текста
					'(73 . 2) ; верт выравнивание текста
					'(370 . -1) ; толщина текста
					 (cons 7 (getvar "textstyle")) ; стиль текста
				);list
			); entmakex
		); setq
	);if

	(setq txt-doc-r
		(entmakex
			(list
				'(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				 (cons 10 (list (+ xpnt-1 1) ypnt-2)) ; нач точка текста
				 (cons 11 (list (+ xpnt-1 1) ypnt-2)) ; нач точка текста
				 (cons 1 str-doc-r) ; содержание текста
				'(40 . 2.5) ; высота текста
						'(41 . 1) ; растяжение текста
						'(50 . 0) ; поворот текста
						'(72 . 0) ; гориз выравнивание текста
						'(73 . 2) ; верт выравнивание текста
						'(370 . -1) ; толщина текста
						(cons 7 (getvar "textstyle")) ; стиль текста
					);list
				); entmakex
	); setq
		
	;выбор текста
	(setq	data-obj (entget txt-doc-r)
				list-txt (assoc 1 data-obj)
				data-obj-erase (cdr (car data-obj))
	);setq
		
	;вычисление длины наименования
	(setq box-txt (textbox data-obj);габариты текста
				len-txt-r (- (car (nth 1 box-txt)) (car (nth 0 box-txt)));длина текста
	);setq
			
	(if (< len-txt-r 95)
		(progn 
			(command "_insert" "вед-осн-компл-рч-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list xpnt-1 ypnt-1))
			(setq ypnt-1 (- ypnt-1 8)
						ypnt-2 (- ypnt-2 8)
			);setq
		);progn
	);if
		
	;******************************************************************
	;******* обрезка текста *******************************************
	;******************************************************************
	(if (> len-txt-r 95)
		(progn
					(while (> len-txt-r 95)
						(setq txt-l ""    ;начальные парамеры текста
									len-txt-l 0
						);setq
			
						;******* цикл по обрезке по 93мм. *******
						(while (< len-txt-l 93)
							(setq pos-blank (vl-string-search " " str-doc-r 0);находим позицию пробела
										txt-cut (substr str-doc-r 1 (+ 1 pos-blank));отсекаем по пробел слева
										str-doc-r (vl-string-left-trim " " (substr str-doc-r (+ 1 pos-blank)));убираем пробел слева в правой части текста
										txt-l (strcat txt-l txt-cut) ;формируем левую часть
							);setq
			
							(setq data-crnt-obj (subst (cons 1 txt-l) list-txt data-obj);заменяем список текста
										box-txt (textbox data-crnt-obj);габариты текста
										len-txt-l (- (car (nth 1 box-txt)) (car (nth 0 box-txt)));вычисление длины левого сегмента текста
							);setq
				 
							(if (eq (vl-string-search " " str-doc-r 0) nil);корректный останов при оставщемся одном слове
								(setq len-txt-l 120)
							);if
						);while (< len-txt-l 93)
						;***************************************
						
						(setq txt-l (substr txt-l 1 (- (strlen txt-l) (1+ pos-blank)));выделяем подстроку
									txt-l (vl-string-right-trim "  " txt-l) ;убираем пробел справа
									str-doc-r (strcat txt-cut str-doc-r)
						);setq
		 
						(setq txt
							(entmakex
								(list
									'(0 . "TEXT")
									'(100 . "AcDbEntity")
									'(100 . "AcDbText")
									 (cons 10 (list (+ xpnt-1 1) ypnt-2)) ; нач точка текста
									 (cons 11 (list (+ xpnt-1 1) ypnt-2)) ; нач точка текста
									 (cons 1 txt-l) ; содержание текста
									'(40 . 2.5) ; высота текста
									'(41 . 1) ; растяжение текста
									'(50 . 0) ; поворот текста
									'(72 . 0) ; гориз выравнивание текста
									'(73 . 2) ; верт выравнивание текста
									'(370 . -1) ; толщина текста
									 (cons 7 (getvar "textstyle")) ; стиль текста
								); end of list
							); entmakex
						); setq
						
						(command "_insert" "вед-осн-компл-рч-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list xpnt-1 ypnt-1))
						
						(setq ypnt-1 (- ypnt-1 8)
									ypnt-2 (- ypnt-2 8)
						);setq
						
						;вычисление длины правого сегмента текста
						(setq data-crnt-obj (subst (cons 1 str-doc-r) list-txt data-obj);заменяем список текста
									box-txt (textbox data-crnt-obj);габариты текста
									len-txt-r (- (car (nth 1 box-txt)) (car (nth 0 box-txt)));длина текста
						);setq
					);while (> len-txt-r 95)

					(setq txt
						(entmakex
							(list
								'(0 . "TEXT")
								'(100 . "AcDbEntity")
								'(100 . "AcDbText")
								 (cons 10 (list (+ xpnt-1 1) ypnt-2)) ; нач точка текста
								 (cons 11 (list (+ xpnt-1 1) ypnt-2)) ; нач точка текста
								 (cons 1 str-doc-r) ; содержание текста
								'(40 . 2.5) ; высота текста
								'(41 . 1) ; растяжение текста
								'(50 . 0) ; поворот текста
								'(72 . 0) ; гориз выравнивание текста
								'(73 . 2) ; верт выравнивание текста
								'(370 . -1) ; толщина текста
								 (cons 7 (getvar "textstyle")) ; стиль текста
							);list
						);entmakex
					); setq
					
					(command "_insert" "вед-осн-компл-рч-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list xpnt-1 ypnt-1))
		
					(setq ypnt-1 (- ypnt-1 8)
								ypnt-2 (- ypnt-2 8)
					);setq
		
			(command "_erase" data-obj-erase "")
		);progn
	);if (> len-txt-r 95)
			
	(setq counter (1+ counter));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but3-02-reference-doc-01

( / counter pnt-1 str-doc txt xpnt-1 ypnt-1)

(setq counter 0);setq

(setq pnt-1 (getpoint "\nУкажите точку вставки\n")
		  xpnt-1 (nth 0 pnt-1)
		  ypnt-1 (nth 1 pnt-1)
);setq
		
(setvar	"OSMODE" 0)

(repeat (length list-901)
	(setq str-doc (nth counter list-901));извлекаем строку с записью документа из списка документов из файла list-1
		
	(setq txt
		(entmakex
			(list
				'(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				(cons 10 (list xpnt-1 ypnt-1)) ; нач точка текста
				(cons 11 (list xpnt-1 ypnt-1)) ; нач точка текста
				(cons 1 str-doc) ; содержание текста
				'(40 . 2.5) ; высота текста
				'(41 . 1) ; растяжение текста
				'(50 . 0) ; поворот текста
				'(72 . 0) ; гориз выравнивание текста
				'(73 . 2) ; верт выравнивание текста
				'(370 . -1) ; толщина текста
				(cons 7 (getvar "textstyle")) ; стиль текста
			);list
		); entmakex
	); setq

	(setq ypnt-1 (- ypnt-1 8));setq
			
	(setq counter (1+ counter));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


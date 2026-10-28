;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// рисование технических требований                             //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:04-tech-req

( / adoc append-lst-tpm counter dcl-id list-01 list-01-read-file list-901 list-doc lngth-list-doc lst-tpm num-iter pnt-1 str-01 str-doc txt-1)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 1)

(read-file-for-dialog-box-01 "04-tech-req.txt" 1)

(setq list-01 list-01-read-file

			list-901 nil
			list-doc ""
			
			str-01 nil
);setq

(if (< (setq dcl-id (load_dialog "dia-04-tech-req.dcl")) 0);формируем окно диалога
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_03_tech_req" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)

(set_tile "txt-01" "0")

(action_tile "but-01"
  (strcat "(filling-fields-04-tech-req)");strcat
);action_tile

(action_tile "but-02"
  (strcat "(done_dialog)");strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(setq counter 0);setq

(repeat (length list-901)
  (setq str-doc (nth counter list-901);извлекаем строку с записью документа из списка документов из файла list-1
  			str-doc (strcat (itoa (+ counter 1)) ". " str-doc)
  
        str-doc (strcat str-doc "\\P")
        list-doc (strcat list-doc str-doc)
        counter (1+ counter)
  );setq
);repeat

(setq list-doc (vl-string-right-trim "\\P" list-doc));setq

;определение длины текстовой строки и опеределение необходимого количества  полей
(setq lngth-list-doc (strlen list-doc)
			num-iter (fix (/ lngth-list-doc 700))
			lst-tpm nil
			append-lst-tpm (cons 3 list-doc)
);setq

(if (= 0 num-iter)
	(setq lst-tpm (list (cons 1 list-doc)));setq
);if

(if (> num-iter 0)
	(repeat num-iter
		(setq lst-tpm (vl-list* append-lst-tpm lst-tpm)
		
					append-lst-tpm (cons 3 list-doc)
					lst-tpm (reverse lst-tpm)
		);setq
	);repeat
);if

(setq lst-tpm (reverse lst-tpm));setq

(setvar "osmode" 6199)

(setq pnt-1 (getpoint "\nУкажите точку вставки\n"));setq


(setvar "osmode" 0)

(setq txt-1
  (entmake
    (vl-list*
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
       (cons 10 pnt-1) ;нач точка текста
      '(8 . "0")
      '(40 . 2.5) ;высота текста
      '(41 . 180) ;растяжение текста
      '(42 . 180) ;ширина текста
      '(44 . 1.2) ;ширина текста
      '(71 . 7) ;гориз выравнивание текста
      '(370 . -1) ;толщина текста
       (cons 7 "Standard") ;стиль текста
       lst-tpm
    );list
  );entmakex
);setq

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец                                                        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun filling-fields-04-tech-req

( / cntr-1 str-01 str-02-01)

(setq str-01 (get_tile "txt-01");список с номерами выбранных строк
      cntr-1 0
);setq
  
(if (/= list-901 nil) (setq list-901 (reverse list-901)));if
  
(setq str-01 (strcat "(" str-01 ")");преобразуем строку в список
      str-01 (read str-01)
);setq

(repeat (length str-01)
  (setq str-02-01 (nth (nth cntr-1 str-01) list-01)
				list-901 (vl-list* str-02-01 list-901)		
				cntr-1 (1+ cntr-1)
	);setq
);repeat


(setq list-901 (reverse list-901));setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



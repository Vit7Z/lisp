;/////// ************************************************************ ////////////////////
;/////// нумерация                                                    ////////////////////
;/////// ************************************************************ ////////////////////
(defun c:04-numbering-devices-1

( / adoc dcl-id str-01 str-02 str-03 type-list)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(if (< (setq dcl-id (load_dialog "dia-04-numbering-devices-1.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_04_numbering_dev_1" dcl-id))
		(exit)
);if

(set_tile "txt-01" "XX")
(set_tile "txt-12" "1")

(action_tile "butn-11"
  (strcat "(setq type-list \"var-01\")"
  				"(setq str-01 (get_tile \"txt-01\"))"
  				"(setq str-02 (get_tile \"txt-12\"))"
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

(if (= type-list "var-01") (var-01-04-numbering-devices-1 str-01 str-02));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////


;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных//////////////////////////////////////////////////////
(defun var-01-04-numbering-devices-1

(str-01 str-02 / sel-txt-data sel-txt-txt sel-txt-typ str-new-txt)

(while (/= nil (setq sel-txt-data (entget (car (entsel "\nВыберите текст\n")))))

	(setq str-new-txt (strcat str-01 str-02) ;склеиваем части новой строки
				str-new-txt (cons 1 str-new-txt)	;делаем список из новой строки
								
				sel-txt-typ (cdr (assoc 0 sel-txt-data))
				sel-txt-txt (assoc 1 sel-txt-data)	;извлекаем список из выбранного текста
				
				sel-txt-data (subst str-new-txt sel-txt-txt sel-txt-data)	;заменяем старую строку новой
	);setq
	
	(entmod sel-txt-data)	;обновляем данные примитива

	(setq str-02 (atoi str-02)
				str-02 (itoa (+ str-02 1))
	);setq
);while

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////
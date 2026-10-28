;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// приведение текста к ***                                      //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:901-txt-destr

( / adoc counter-txt data-modified-txt dcl-id list-01 list-01-read-file lngth-modified-txt modified-txt new-symbols-txt old-symbols-txt str-01)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))) ; start undo

(setvar "cmdecho" 0)

(read-file-for-dialog-box-01 "901-txt-destr.txt" 1)

(setq list-01 list-01-read-file);setq

(if (< (setq dcl-id (load_dialog "dia-901-txt-destr.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_901_txt_destr" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)

(set_tile "txt-01" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "accept"
  (strcat "(setq str-01 (nth 0 list-01))"
  				"(done_dialog)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(prompt "\nВыберите текст\n"); выбираем набор модифицируемого текста
	
(setq	modified-txt (ssget '((0 . "*text")))
			lngth-modified-txt (sslength modified-txt)	; количество элементов в наборе
);setq

(setq	new-symbols-txt (cons 1 str-01));setq

(setq counter-txt 0) ;счетчик цикла

(repeat	lngth-modified-txt
  (setq	data-modified-txt (entget (ssname modified-txt counter-txt)) ; получаем содержимое текущего примитива текста
        old-symbols-txt (assoc 1 data-modified-txt)
        data-modified-txt (subst new-symbols-txt old-symbols-txt data-modified-txt) ; заменяем данные текста
  );setq

  (entmod data-modified-txt) ; обновляем текущий текст
  (setq	counter-txt (+ 1 counter-txt));setq
);repeat

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////
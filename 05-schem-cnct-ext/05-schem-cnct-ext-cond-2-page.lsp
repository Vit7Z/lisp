;//////// ************************************************************ //////////////////////////////////////////////////////////////////
;//////// второй лист ССВП                                             //////////////////////////////////////////////////////////////////
;//////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:05-schem-cnct-ext-cond-2-page

( / adoc block-name dcl-id pnt-ins rctgl-1 rctgl-2 rctgl-3 rctgl-4 txt-1 txt-2 txt-3 txt-4 x-pnt-ins y-pnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(if (= (tblsearch "block" "ссвп-таблица-данных") nil) ; создаем блок таблицы данных
  (progn
    (setvar "osmode" 0)
		(command "_rectangle" '(0 0) '(32 -16))		
		(setq rctgl-1 (entlast))
		(command "_rectangle" '(0 -16) '(32 -24))		
		(setq rctgl-2 (entlast))
		(command "_rectangle" '(0 -24) '(32 -32))		
		(setq rctgl-3 (entlast))
		(command "_rectangle" '(0 -32) '(32 -44))		
		(setq rctgl-4 (entlast))
			
			(setq txt-1
        (entmakex
          (list
         '(0 . "MTEXT")
         '(100 . "AcDbEntity")
         '(100 . "AcDbMText")
         '(10 1. -8) ; нач точка текста
         '(1 . "Наименование параметра и место отбора импульса") ; содержание текста
         '(8 . "0")
         '(40 . 2.5) ; высота текста
         '(41 . 31) ; растяжение текста
         '(42 . 31) ; ширина текста
         '(71 . 4) ; гориз выравнивание текста
         '(370 . -1) ; толщина текста
          (cons 7 (getvar "textstyle")) ; стиль текста
          );list
        ); entmakex
			); setq

			(setq txt-2
        (entmakex
          (list
            '(0 . "MTEXT")
            '(100 . "AcDbEntity")
            '(100 . "AcDbMText")
            '(10 1. -20) ; нач точка текста
            '(1 . "Категория трубной проводки") ; содержание текста
            '(8 . "0")
            '(40 . 2.5) ; высота текста
            '(41 . 31) ; растяжение текста
            '(42 . 31) ; ширина текста
            '(71 . 4) ; гориз выравнивание текста
            '(370 . -1) ; толщина текста
             (cons 7 (getvar "textstyle")) ; стиль текста
          );list
        ); entmakex
			); setq			

			(setq txt-3
        (entmakex
          (list
         '(0 . "MTEXT")
         '(100 . "AcDbEntity")
         '(100 . "AcDbMText")
         '(10 1. -28) ; нач точка текста
         '(1 . "Обозначение чертежа установки") ; содержание текста
         '(8 . "0")
         '(40 . 2.5) ; высота текста
         '(41 . 31) ; растяжение текста
         '(42 . 31) ; ширина текста
         '(71 . 4) ; гориз выравнивание текста
         '(370 . -1) ; толщина текста
          (cons 7 (getvar "textstyle")) ; стиль текста
          );list
        ); entmakex
			); setq			

			(setq txt-4
        (entmakex
          (list
            '(0 . "MTEXT")
            '(100 . "AcDbEntity")
            '(100 . "AcDbMText")
            '(10 1. -38) ; нач точка текста
            '(1 . "Поз. обозначение (по спецификации оборудования)") ; содержание текста
            '(8 . "0")
            '(40 . 2.5) ; высота текста
            '(41 . 31) ; растяжение текста
            '(42 . 31) ; ширина текста
            '(71 . 4) ; гориз выравнивание текста
            '(370 . -1) ; толщина текста
             (cons 7 (getvar "textstyle")) ; стиль текста
          );list
        ); entmakex
			); setq		
	  (command "_block" "ссвп-таблица-данных" '(0 0) rctgl-1 rctgl-2 rctgl-3 rctgl-4 txt-1 txt-2 txt-3 txt-4 "") ;command
  );progn
);if

(if (< (setq dcl-id (load_dialog "dia-05-schem-cnct-ext-cond-2-page.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_05_schem_cnct_ext_cond_2_page" dcl-id))
		(exit)
);if

(action_tile "but-01"
  (strcat "(setq block-name \"а3-спдс-лист-2-гориз\")"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "but-02"
  (strcat "(setq block-name \"а4-спдс-лист-2-верт\")"
  				"(done_dialog)"
  );srcat
);action_tile

(start_dialog)

(unload_dialog dcl-id)

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
  (setq x-pnt-ins (nth 0 pnt-ins)
    	  y-pnt-ins (nth 1 pnt-ins)
  );setq
    
  (setvar "osmode" 0)
  
  (command "_insert" block-name "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)
  
  (command "_insert" "ссвп-таблица-данных" "_x" 1 "_y" 1 "_z" 1 "_r" 0 (list (+ x-pnt-ins 60) (+ y-pnt-ins 292)))
  
 (setvar "osmode" 6199)
);while

(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
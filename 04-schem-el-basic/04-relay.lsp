;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// рисование реле                                               ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:04-relay

( / adoc angl angl-blck line-1 line-2 pnt-drct pnt-ins pnt-txt rctn-1 txt-1 xpnt-ins ypnt-ins)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

(setvar	"cmdecho" 0)
(setvar "osmode" 0)

(if	(= (tblsearch "block" "реле-спэ") nil) ; ищем блок с именем
  (progn
    
    (command "_line" '(0 0) '(5 0) "")
    (setq line-1 (entlast))
    
    (command "_line" '(11 0) '(16 0) "")
    (setq line-2 (entlast))

		(command "_RECTANGLE" '(5 5) '(11 -5))
		(setq rctn-1 (entlast))

    (command "_block" "реле-спэ" '(0 0) line-1 line-2 rctn-1 "")
  );progn
);if

(setvar "osmode" 6199)

(setq	pnt-ins (getpoint "\nУкажите точку вставки\n")
      xpnt-ins (nth 0 pnt-ins)
      ypnt-ins (nth 1 pnt-ins)
		pnt-drct (getpoint "\nУкажите направление\n")
		angl (atoi (angtos (angle pnt-ins pnt-drct))) ; угол вставки
);setq


;вертикально вверх
(if (and (< angl 135) (> angl 45));and
	(setq angl-blck 90);setq
);if

; влево
(if (and (<= angl 225) (>= angl 135));and
	(progn
		(setq angl-blck 0
					pnt-ins (list (- xpnt-ins 16) ypnt-ins)
					pnt-txt (list (- xpnt-ins 8) (+ ypnt-ins 5))
		);setq

    (setq txt-1
  		(entmakex
				(list
					'(0 . "TEXT")
					'(100 . "AcDbEntity")
					'(100 . "AcDbText")
					 (cons 10 pnt-txt) ; нач точка текста
					 (cons 11 pnt-txt) ; нач точка текста
					'(1 . "****") ; содержание текста
					'(40 . 2.5) ; высота текста
					'(41 . 1) ; растяжение текста
					'(50 . 0) ; поворот текста
					 (cons 72 1) ; гориз выравнивание текста
					 (cons 73 1) ; верт выравнивание текста
					'(370 . -1) ; толщина текста
					 (cons 7 (getvar "textstyle")) ; стиль текста
				) ;list
			);entmakex
    );setq
	);progn
);if

;вниз
(if (and (< angl 315) (> angl 225));and
	(setq angl-blck 90
        pnt-ins (list xpnt-ins (- ypnt-ins 16))
  );setq
);if

; вправо
(if (or (<= angl 45) (>= angl 315));and
	(progn
		(setq angl-blck 0
					pnt-txt (list (+ xpnt-ins 8) (+ ypnt-ins 5))
		);setq

    (setq txt-1
  		(entmakex
				(list
					'(0 . "TEXT")
					'(100 . "AcDbEntity")
					'(100 . "AcDbText")
					 (cons 10 pnt-txt) ; нач точка текста
					 (cons 11 pnt-txt) ; нач точка текста
					'(1 . "****") ; содержание текста
					'(40 . 2.5) ; высота текста
					'(41 . 1) ; растяжение текста
					'(50 . 0) ; поворот текста
					 (cons 72 1) ; гориз выравнивание текста
					 (cons 73 1) ; верт выравнивание текста
					'(370 . -1) ; толщина текста
					 (cons 7 (getvar "textstyle")) ; стиль текста
				) ;list
			);entmakex
    );setq
	);progn
);if

(setvar "osmode" 0)
(setvar	"cmdecho" 0)
(command "_insert" "реле-спэ" "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-ins)

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "orthomode" 1)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
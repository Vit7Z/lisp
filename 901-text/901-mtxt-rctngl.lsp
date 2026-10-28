;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// создание многострочного текста внутри прямоугольной области //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:901-mtxt-rctngl

( / adoc dcl-id dltx dlty list-01 list-01-read-file list-02 list-02-read-file lngth pnt-1 pnt-2 pnt-txt pos str-02 txt-1 xpnt-1 xpnt-2 xtmp ypnt-1 ypnt-2 ytmp)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(setvar "cmdecho" 1)
(setvar "osmode" 6199)

(read-file-for-dialog-box-01 "901-mtxt-rctngl.txt" 2)

(setq list-01 list-01-read-file
			list-02 list-02-read-file
);setq

(if (< (setq dcl-id (load_dialog "dia-901-mtxt-rctngl.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_901_mtxt_rctngl" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)

(action_tile "txt-01"
  (strcat "(setq str-02 (nth (atoi (get_tile \"txt-01\")) list-02))"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-02 (nth (atoi (get_tile \"txt-02\")) list-02))"
  				"(done_dialog)"
  );srcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(setq pnt-1 (getpoint "\nУкажите левую нижнюю точку\n")
			xpnt-1 (nth 0 pnt-1) 
			ypnt-1 (nth 1 pnt-1)
			pnt-2 (getpoint "\nУкажите правую верхнюю точку\n")	
			xpnt-2 (nth 0 pnt-2) 
			ypnt-2 (nth 1 pnt-2)
);setq
	
(setvar "osmode" 0)
	
(setq	pos (ssget "_c" pnt-1 pnt-2 '((0 . "*TEXT"))));setq

(if (/= pos nil) (command "_erase" pos ""));if

(if (> xpnt-1 xpnt-2)
  (setq xtmp xpnt-1
        xpnt-1 xpnt-2
        xpnt-2 xtmp
  );setq
);if

(if (> ypnt-1 ypnt-2)
  (setq ytmp ypnt-1
        ypnt-1 ypnt-2
        ypnt-2 ytmp
  );setq
);if

(setq dltx (/ (- xpnt-2 xpnt-1) 2)
      dlty (/ (- ypnt-2 ypnt-1) 2)
      pnt-txt (list (+ xpnt-1 dltx) (+ ypnt-1 dlty))
      lngth (* dltx 2)
);setq

(setq txt-1
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
       (cons 10 pnt-txt) ; нач точка текста
       (cons 1 str-02) ; содержание текста
      '(40 . 2.5) ; высота текста
       (cons 41 lngth) ; растяжение текста
       (cons 42 lngth) ; ширина текста
      '(71 . 5) ; гориз выравнивание текста
      
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    );list
  );entmakex
);setq

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////







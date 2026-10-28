;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// создание однострочного текста внутри пр€моугольной области //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:901-txt-rctngl

( / adoc dcl-id dltx dlty list-01 list-01-read-file list-02 list-02-read-file lngth pnt-1 pnt-2 pnt-txt pos str-02 txt-1 xpnt-1 xpnt-2 xtmp ypnt-1 ypnt-2 ytmp)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(setq pnt-1 (getpoint "\n”кажите левую нижнюю точку\n")
			xpnt-1 (nth 0 pnt-1) 
			ypnt-1 (nth 1 pnt-1)
			pnt-2 (getpoint "\n”кажите правую верхнюю точку\n")	
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

(setvar	"OSMODE" 0)

(command "_TEXT" "_MC" pnt-txt 2.5 0 "****")

(setvar	"OSMODE" 6199)

(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////







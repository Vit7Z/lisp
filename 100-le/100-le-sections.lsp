;;; ///////////////////////////////////////////////// îôîğìëåíèå ïåğå÷íÿ ıëåìåíòîâ ///////////////////////
(defun c:100-le-sections

( / adoc box-txt dcl-id list-01 list-01-read-file list-02 nmbr-ln p21-c p22-c pnt-ins scale-len-txt txt-01 xpnt-ins ypnt-ins)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setvar "textstyle" "standard")

(100-le-empty-line-02)

(setvar "cmdecho" 0)

(read-file-for-dialog-box-01 "100-le-sections-std.txt" 1);setq

(setq list-01 list-01-read-file);setq

(read-file-for-dialog-box-01 "100-le-sections-dif.txt" 1);setq

(setq list-02 list-01-read-file);setq

(if (< (setq dcl-id (load_dialog "dia-100-le-sections.dcl")) 0) ;èùåì äèàëîã
		(progn
			(alert "Íå íàéäåí dcl-ôàéë")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_100_le_auto" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)

(list-filling "txt-02" list-02)

(action_tile "txt-01"
  (strcat "(setq txt-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq txt-01 (nth (atoi (get_tile \"txt-02\")) list-02))"
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

(if (= txt-01 "ÒÅÕ. ÑĞÅÄÑÒÂÀ ÑÀ ÏÎÑÒÀÂËßÅÌÛÅ ...")
	(setq txt-01 "ÒÅÕÍÈ×ÅÑÊÈÅ ÑĞÅÄÑÒÂÀ ÀÂÒÎÌÀÒÈÇÖÈÈ, ÏÎÑÒÀÂËßÅÌÛÅ ÊÎÌÏËÅÊÒÍÎ Ñ ÎÁÎĞÓÄÎÂÀÍÈÅÌ");setq
);if

(setq	box-txt (textbox (list (cons 1 txt-01) (cons 40 2.5) (cons 50 0) (cons 41 1)));îïğåäåëÿåì äëèíó òåêñòà
			p21-c (car (nth 0 box-txt))
			p22-c (car (nth 1 box-txt))
			scale-len-txt (- p22-c p21-c);äëèíà òåêñòà
			
			nmbr-ln (fix (/ scale-len-txt 108))
);setq

(setvar "osmode" 6199)

(setq	pnt-ins (getpoint "\nÓêàæèòå òî÷êó âñòàâêè\n")
			xpnt-ins (nth 0 pnt-ins)
			ypnt-ins (nth 1 pnt-ins)
);setq

(if (= nmbr-ln 0)
	(progn
		(del-str-100-auto-le-sections 2 xpnt-ins ypnt-ins)		
		(command "_TEXT" "_MC" (list (+ xpnt-ins 55) (- ypnt-ins 4)) 2.5 0 (strcat "%%U" txt-01))
	);progn
);if

(if (= nmbr-ln 1)
	(progn
		(del-str-100-auto-le-sections 3 xpnt-ins ypnt-ins)		
		(str-2-100-auto-le-sections txt-01 xpnt-ins ypnt-ins)
	);progn
);if

(vla-endundomark adoc)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;/////// *************************************************************//////////////////////////////////////////////////////////////////////////////////////////
;/////// ÊÎÍÅÖ ÏĞÎÃĞÀÌÌÛ                                              //////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************//////////////////////////////////////////////////////////////////////////////////////////


;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////////////////////////////////////////////
(defun del-str-100-auto-le-sections

(nmbr-ln xpnt-ins ypnt-ins / st-1)

(setvar "osmode" 0)

;;;;;;; óäàëÿåì ñóùåñòâóşùóş íàäïèñü
(repeat nmbr-ln
	(setq st-1 (ssget "_c" (list (+ xpnt-ins 108) (- ypnt-ins 2)) (list (+ xpnt-ins 2) (- ypnt-ins 6))));setq, âûáèğàåì òåêñò
	
	(if (/= st-1 nil) (command "_erase" st-1 ""));if óäàëÿåì òåêñò
	
	(setq st-1 nil
				st-1 (ssget "_c" (list (+ xpnt-ins 1) (- ypnt-ins 7)) (list (- xpnt-ins 1) (- ypnt-ins 1))) ;;;;;;;âûáèğàåì ëèíèè
	);setq, ñòğîêè Ïİ
	
	(if (/= st-1 nil) (command "_erase" st-1 ""));if óäàëÿåì ëèíèè
	
	(command "_insert" "ïı-ïóñòàÿ-ñòğîêà" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list xpnt-ins ypnt-ins))
	
	(setq ypnt-ins (- ypnt-ins 8));setq
);repeat

(princ)
)
;///////                                                              //////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////


;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////////////////////////////////////////////
(defun str-2-100-auto-le-sections 

(txt-01 xpnt-ins ypnt-ins / txt-l txt-r)

(setvar "osmode" 0)

(if (= txt-01 "ÒÅÕÍÈ×ÅÑÊÈÅ ÑĞÅÄÑÒÂÀ ÀÂÒÎÌÀÒÈÇÖÈÈ, ÏÎÑÒÀÂËßÅÌÛÅ ÊÎÌÏËÅÊÒÍÎ Ñ ÎÁÎĞÓÄÎÂÀÍÈÅÌ")
	(setq txt-l "%%UÒÅÕÍÈ×ÅÑÊÈÅ ÑĞÅÄÑÒÂÀ ÀÂÒÎÌÀÒÈÇÖÈÈ,"
				txt-r "%%uÏÎÑÒÀÂËßÅÌÛÅ ÊÎÌÏËÅÊÒÍÎ Ñ ÎÁÎĞÓÄÎÂÀÍÈÅÌ"
	);setq
);if

(if (= txt-01 "ØÊÀÔ ÊÎÌÌÅĞ×ÅÑÊÈÕ ÓÇËÎÂ Ó×ÅÒÀ ÒÅÏËÎÂÎÉ İÍÅĞÃÈÈ")
	(setq txt-l "%%UØÊÀÔ ÊÎÌÌÅĞ×ÅÑÊÈÕ ÓÇËÎÂ Ó×ÅÒÀ"
				txt-r "%%uÒÅÏËÎÂÎÉ İÍÅĞÃÈÈ"
	);setq
);if

(if (= txt-01 "ØÊÀÔ ÓÏĞÀÂËÅÍÈß ÍÀÑÎÑÍÎÉ ÑÒÀÍÖÈÅÉ ÏÎÆÀĞÎÒÓØÅÍÈß (ØÓ ÍÑÏ)")
	(setq txt-l "%%UØÊÀÔ ÓÏĞÀÂËÅÍÈß"
				txt-r "%%uÍÀÑÎÑÍÎÉ ÑÒÀÍÖÈÅÉ ÏÎÆÀĞÎÒÓØÅÍÈß (ØÓ ÍÑÏ)"
	);setq
);if

(command "_TEXT" "_MC" (list (+ xpnt-ins 55) (- ypnt-ins 4)) 2.5 0 txt-l)

(command "_TEXT" "_MC" (list (+ xpnt-ins 55) (- ypnt-ins 12)) 2.5 0 txt-r)

(princ)
)
;///////                                                              //////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////

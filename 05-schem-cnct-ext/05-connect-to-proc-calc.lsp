;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// íàçâàíèå ïğîãğàììû****************                           ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:05-connect-to-proc-calc

( / adoc cntr-1 cntr-2 crnt-txt key-txt list-900 list-901 lngth-set pnt-ins set-txt x-901 x-pnt-ins y-pnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setq	set-txt (ssget '((0 . "*text")))
			lngth-set (sslength set-txt)
			cntr-1 0
			list-900 (list nil)
);setq

(repeat lngth-set
	(setq crnt-txt (list (cdr (assoc 1 (entget (ssname set-txt cntr-1)))))				
				list-900 (append list-900 crnt-txt)
				cntr-1 (1+ cntr-1)
	);setq
);repeat

(setq list-900 (vl-sort (vl-remove nil list-900) '<)	
			cntr-1 1			
			cntr-2 1				
			lngth-set (- (length list-900) 1)				
			key-txt (nth 0 list-900)			
			list-901 (list nil)
);setq

(repeat lngth-set
	(setq crnt-txt (nth cntr-2 list-900));setq
	(if (/= crnt-txt key-txt)
		(setq x-901 (list (list key-txt (itoa cntr-1) "øò"))						
					list-901 (append list-901 x-901)						
					key-txt crnt-txt						
					cntr-1 1
			);setq
			
		(setq cntr-1 (1+ cntr-1));setq
	);if

	(setq cntr-2 (1+ cntr-2));setq
);repeat

(setq x-901 (list (list key-txt (itoa cntr-1) "øò"))
			list-901 (vl-remove nil (append list-901 x-901))
);setq

(setq pnt-ins (getpoint "\nÓêàæèòå òî÷êó âñòàâêè\n")
	  	x-pnt-ins (nth 0 pnt-ins)
	 		y-pnt-ins (nth 1 pnt-ins)
	 		cntr-1 0
);setq

(setvar "osmode" 0)

(repeat (length list-901)
	(command "_text" "_ml" (list x-pnt-ins y-pnt-ins) 2.5 0 (nth 0 (nth cntr-1 list-901)))
	(command "_text" "_ml" (list (+ x-pnt-ins 20) y-pnt-ins) 2.5 0 (nth 1 (nth cntr-1 list-901)))
	(command "_text" "_ml" (list (+ x-pnt-ins 25) y-pnt-ins) 2.5 0 (nth 2 (nth cntr-1 list-901)))
	
	(setq y-pnt-ins (- y-pnt-ins 5)
				cntr-1 (1+ cntr-1)
	);setq
);repeat

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ÊÎÍÅÖ ÏĞÎÃĞÀÌÌÛ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////

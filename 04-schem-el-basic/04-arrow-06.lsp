;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
(defun 04-arrow-06

(lngth-arrow / adoc angl dist-1 dist-2 pnt-2 pnt-3 pnt-drctn pnt-ins w-half)

(setvar "textstyle" "standard")

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(cond
	((= lngth-arrow 3) (setq w-half 2));
	((= lngth-arrow 2) (setq w-half 1));
	((= lngth-arrow 5) (setq w-half 2.2));
);cond

(while (/= (setq pnt-ins (getpoint "\nУкажите точку 1 (начало)\n")) nil)
	(setq pnt-drctn		(getpoint "\nУкажите точку 2 (конец)\n")			
				angl (angle pnt-ins pnt-drctn)
				
				dist-1 (distance pnt-ins pnt-drctn)
				dist-2 (- dist-1 lngth-arrow)
				
				pnt-2 (polar pnt-ins angl dist-2)
				pnt-3 (polar pnt-ins angl dist-1)
	);setq

	(setvar "osmode" 0)
	(command "_pline" pnt-ins "_w" 0 0 pnt-2 "_w" w-half 0 pnt-3 "")
	(setvar "osmode" 6199)
);while

(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(vla-endundomark adoc)
(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
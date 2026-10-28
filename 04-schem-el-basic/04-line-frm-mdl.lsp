;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
;/////// выбор длины стрелки                                          //////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
(defun c:04-line-frm-mdl

( / adoc dcl-id type-list-01)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(if (< (setq dcl-id (load_dialog "dia-04-line-frm-mdl.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_04_line_frm_mdl" dcl-id))
	(exit)
);if

(action_tile "but-1"
  (strcat "(setq type-list-01 \"2 линии\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-2"
  (strcat "(setq type-list-01 \"3 линии\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-3"
  (strcat "(setq type-list-01 \"5 линий\")"
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

(cond
	((= type-list-01 "2 линии") (04-line-frm-mdl-01 2));=
	((= type-list-01 "3 линии") (04-line-frm-mdl-01 3));=
	((= type-list-01 "5 линий") (04-line-frm-mdl-01 5));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(princ)
)

;/////// *************************************************************//////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              //////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************//////////////////////////////////////////////////////////////////////////////


;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
;/////// рисование параллельных линий на расстоянии 5мм. от середины  //////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
(defun 04-line-frm-mdl-01

(qntt-phs / angl pnt-1 pnt-2 pnt-drct pnt-txt strt-dlt xpnt-1 xpnt-drct ypnt-1 ypnt-drct)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(cond
	((= qntt-phs 2) (setq strt-dlt 2.5));=
	((= qntt-phs 3) (setq strt-dlt 5));=
	((= qntt-phs 5) (setq strt-dlt 10));=
);cond

(while (/= (setq pnt-1 (getpoint "\nУкажите начальную точку\n")))
	(setq xpnt-1 (nth 0 pnt-1)
				ypnt-1 (nth 1 pnt-1)
				pnt-drct (getpoint "\nУкажите направление\n")
				xpnt-drct (nth 0 pnt-drct)
				ypnt-drct (nth 1 pnt-drct)
				angl (atoi (angtos (angle pnt-1 pnt-drct)))
	);setq
	
	(if (and (<= angl 135) (>= angl 45))
		(progn
			(setq xpnt-1 (- xpnt-1 strt-dlt)
			);setq
			(repeat qntt-phs
				(setq pnt-1 (list xpnt-1 ypnt-1)
							pnt-2 (list xpnt-1 (+ ypnt-1 14))
							pnt-txt (list xpnt-1 (+ ypnt-1 1))
				);setq
				(setvar "osmode" 0)
				(command "_.line" pnt-1 pnt-2 "")
				(command "_text" "_bl" pnt-txt 2.5 90 "***")
				(setq xpnt-1 (+ xpnt-1 5)
				);setq
			);repeat
		);progn
	);if
	
	(if (and (<= angl 315) (>= angl 225))
		(progn
			(setq xpnt-1 (- xpnt-1 strt-dlt)
						ypnt-1 (- ypnt-1 18)
			);setq
			(repeat qntt-phs
				(setq pnt-1 (list xpnt-1 ypnt-1)
							pnt-2 (list xpnt-1 (+ ypnt-1 14))
							pnt-txt (list xpnt-1 (+ ypnt-1 1))
				);setq
				(setvar "osmode" 0)
				(command "_.line" pnt-1 pnt-2 "")
				(command "_text" "_bl" pnt-txt 2.5 90 "***")
				(setq xpnt-1 (+ xpnt-1 5)
				);setq
			);repeat
		);progn
	);if
	
	(if (or (>= angl 315) (<= angl 45))
		(progn
			(setq ypnt-1 (+ ypnt-1 strt-dlt)
			);setq
			(repeat qntt-phs
				(setq pnt-1 (list xpnt-1 ypnt-1)
							pnt-2 (list (+ xpnt-1 14) ypnt-1)
							pnt-txt (list (+ xpnt-1 1) ypnt-1)
				);setq
				(setvar "osmode" 0)
				(command "_.line" pnt-1 pnt-2 "")
				(command "_text" "_bl" pnt-txt 2.5 0 "***")
				(setq ypnt-1 (- ypnt-1 5)
				);setq
			);repeat
		);progn
	);if

	(if (and (>= angl 135) (<= angl 225))
		(progn
			(setq ypnt-1 (+ ypnt-1 strt-dlt)
						xpnt-1 (- xpnt-1 14)
			);setq
			(repeat qntt-phs
				(setq pnt-1 (list xpnt-1 ypnt-1)
							pnt-2 (list (+ xpnt-1 14) ypnt-1)
							pnt-txt (list (+ xpnt-1 1) ypnt-1)
				);setq
				(setvar "osmode" 0)
				(command "_.line" pnt-1 pnt-2 "")
				(command "_text" "_bl" pnt-txt 2.5 0 "***")
				(setq ypnt-1 (- ypnt-1 5)
				);setq
			);repeat
		);progn
	);if
	(setvar "osmode" 6199)
);while

(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
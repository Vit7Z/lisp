;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
;/////// выбор длины стрелки                                          //////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
(defun c:04-line-of-phase

( / adoc dcl-id type-list-01)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(if (< (setq dcl-id (load_dialog "dia-04-line-of-phase.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_04_phase_line" dcl-id))
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
	((= type-list-01 "2 линии") (04-line-of-phase-01 2));=
	((= type-list-01 "3 линии") (04-line-of-phase-01 3));=
	((= type-list-01 "5 линий") (04-line-of-phase-01 5));=
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
;/////// рисование параллельных линий на расстоянии 5мм.              //////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
(defun 04-line-of-phase-01

(qntt-phs / angl dltx dlty drtctn pnt-1 pnt-2 pnt-drct xpnt-1 xpnt-2 xpnt-drct ypnt-1 ypnt-2 ypnt-drct)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(while (/= (setq pnt-1 (getpoint "\nУкажите начальную точку\n")) nil)
	(setq xpnt-1 (nth 0 pnt-1)
				ypnt-1 (nth 1 pnt-1)
				pnt-2 (getpoint "\nУкажите конечнюю точку\n")
				xpnt-2 (nth 0 pnt-2)
				ypnt-2 (nth 1 pnt-2)
				pnt-drct (getpoint "\nУкажите направление\n")
				xpnt-drct (nth 0 pnt-drct)
				ypnt-drct (nth 1 pnt-drct)
				angl (atoi (angtos (angle pnt-1 pnt-2)))
	);setq
	
	(cond
		((or (and (<= angl 135) (>= angl 45))
				 (and (<= angl 315) (>= angl 225)));вверх, вниз вертикально
			(cond
				((< xpnt-1 xpnt-drct) (setq drtctn "vrtc" dltx 5));=
				((> xpnt-1 xpnt-drct) (setq drtctn "vrtc" dltx -5));=
			);cond
		);=
		((or (or (>= angl 315) (<= angl 45))
				 (and (<= angl 225) (>= angl 135)));влево, вправо горизонтально
			(cond
				((< ypnt-1 ypnt-drct) (setq drtctn "hrzt" dlty 5));=
				((> ypnt-1 ypnt-drct) (setq drtctn "hrzt" dlty -5));=
			);cond
		);=
	);cond
	(if (= drtctn "vrtc");вертикальн
		(repeat qntt-phs
			(setq pnt-1 (list xpnt-1 ypnt-1)
						pnt-2 (list xpnt-1 ypnt-2)
			);setq
			(setvar "osmode" 0)
			(command "_.line" pnt-1 pnt-2 "")
			(setq xpnt-1 (+ xpnt-1 dltx)
			);setq
		);repeat
	);if
	
	(if (= drtctn "hrzt");горизонтально
		(repeat qntt-phs
			(setq pnt-1 (list xpnt-1 ypnt-1)
						pnt-2 (list xpnt-2 ypnt-1)
			);setq
			(setvar "osmode" 0)
			(command "_.line" pnt-1 pnt-2 "")
			(setq ypnt-1 (+ ypnt-1 dlty)
			);setq
		);repeat
	);if
	(setvar "osmode" 6199)
);while

(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// приборы для измерения уровня                                ////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:101-01-lvl-01-general

( / adoc dcl-id list-01 list-02 list-03 type-list-02)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-01 (list "***"
										"***"
										"***"
										
										));setq

(setq list-02 (list "Датчик-реле уровня РОС 301"
										"****"
										
										));setq
						
(setq list-03 (list "***"
										"***"
										"***"));setq

(if (< (setq dcl-id (load_dialog "dia-101-01-lvl-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_lvl_sens_general" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)

(action_tile "txt-01"
  (strcat "(setq type-list-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq type-list-02 (nth (atoi (get_tile \"txt-02\")) list-02))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq type-list-03 (nth (atoi (get_tile \"txt-03\")) list-03))"
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

;(cond
;	((= type-list-01 "****") (load "d:\\mcloud\\my-support\\101-01-press-sens\\101-01-press-sens-rosma-km.lsp") (101-01-press-sens-rosma-km));if
;	((= type-list-01 "МП4-У, ВП4-У, МВП4-У") (load "d:\\mcloud\\my-support\\101-01-press-sens\\101-mp4u.lsp") (101-mp4u));if
;	((= type-list-01 "МТИ, Энгельс") (load "d:\\mcloud\\my-support\\101-01-press-sens\\101-mti.lsp") (101-mti));if
;	((= type-list-01 "МПТИ, Манотомь") (load "d:\\mcloud\\my-support\\101-01-press-sens\\101-01-press-sens-mpti-manotom.lsp") (101-01-press-sens-mpti-manotom));if
;);cond
							
(cond	
	((= type-list-02 "Датчик-реле уровня РОС 301") (load "d:\\mcloud\\my-sprt\\101-01-lvl-sens\\101-01-lvl-ros-301.lsp") (101-01-lvl-ros-301));if
	
);cond
	
;(cond	
;	((= type-list-03 "Метран 55") (load "d:\\mcloud\\my-support\\101-01-press-sens\\101-metran-55.lsp") (101-metran-55));if
;	((= type-list-03 "Метран 150") (load "d:\\mcloud\\my-support\\101-01-press-sens\\101-metran-150-pt.lsp") (101-metran-150-pt));if
;;	((= type-list "but-112") (load "E:\\my-support\\101-01-press-sens\\101-mti.lsp") (101-mti));if
;;	((= type-list "but-121") (load "E:\\my-support\\101-01-press-sens\\101-dem-102.lsp") (101-dem-102));if
;;	((= type-list "but-122") (load "E:\\my-support\\101-01-press-sens\\101-dungs-gw-a6.lsp") (101-dungs-gw-a6));if
;;	((= type-list "but-123") (load "E:\\my-support\\101-01-press-sens\\101-dm-2005.lsp") (101-dm-2005));if
;;	((= type-list "but-124") (load "E:\\my-support\\101-01-press-sens\\101-kpi-35.lsp") (101-kpi-35));if
;);cond

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// конец программы ///////////////////////////////////////

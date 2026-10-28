;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// приборы для измерения расхода                                ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:101-01-flow-01-general

( / adoc dcl-id list-01 list-02 list-03 type-list-02 type-list-03)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo
								
(setq list-02 (list "US-800"
;										"Акрон-01"
;										"ВЗЛЕТ-ЭР"
;										"ЭМИС-ВИХРЬ-200"
;										"EJA110A, Эталон"
;										"PRO-V"
;										"Torbar"
;										"УРЖ2КМ"
										));setq

(setq list-03 (list "FQS-U30G, Danfoss"));setq

(if (< (setq dcl-id (load_dialog "dia-101-01-flow-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_flwmtr_general" dcl-id))
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

(cond
	((= type-list-02 "US-800") (load "d:\\yandexdisk\\my-sprt\\101-01-flow-01\\101-01-flow-us800-01-general.lsp") (101-01-flow-us800-01-general));=
;	((= type-list-02 "Акрон-01") (load "d:\\mcloud\\my-sprt\\101-01-flwmtr\\101-akron.lsp") (101-akron));=
;	((= type-list-02 "УРЖ2КМ") (load "d:\\mcloud\\my-sprt\\101-01-flwmtr\\101-urg2km.lsp") (101-urg2km));=
;	((= type-list-02 "ВЗЛЕТ-ЭР") (load "d:\\mcloud\\my-sprt\\101-01-flwmtr\\101-01-flwmtr-vzljot-er.lsp") (101-01-flwmtr-vzljot-er));=

);cond

(cond
	((= type-list-03 "FQS-U30G, Danfoss") (load "d:\\mcloud\\my-sprt\\101-01-flwmtr\\101-01-danfoss-fqs-u30g.lsp") (101-01-danfoss-fqs-u30g));=

);cond



(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// конец программы ///////////////////////////////////////
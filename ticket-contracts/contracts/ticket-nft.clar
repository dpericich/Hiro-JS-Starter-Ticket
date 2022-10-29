;; ticket-nft
;; <add a description here>
(impl-trait .nft-contract.nft-trait)

;; constants
;;
(define-constant CONTRACT_OWNER tx-sender)
(define-constant MAXIMUM_TICKET_QTY u50)
;; Set base price f
(define-constant TICKET_PRICE u35)

;; ERRORS
(define-constant ERR_NOT_ENOUGH_STX (err u103))
(define-constant ERR_ALL_TICKETS_PURCHASED (err u104))

;; data maps and vars
;;
(define-data-var last-token-id uint u1)
(define-non-fungible-token tickets uint)

;; read-only functions
;;
(define-read-only (get-last-token-id)
  (ok (var-get last-token-id))
)

(define-read-only (get-token-uri (token-id uint))
  (ok none)
)

(define-read-only (get-owner (token-id uint))
  (nft-get-owner? tickets token-id)
)

;; public functions
;;

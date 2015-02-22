module 9p2000

import Effects
import Effect.StdIO
import Effect.Default
import Effect.State

import System.Protocol

%access public

knockknock : Protocol ['Client, 'Server] ()
knockknock = do
  'Client ==> 'Server | Literal "Knock Knock"
  'Server ==> 'Client | Literal "Who's there?"
  res <- 'Client ==> 'Server | String
  'Server ==> 'Client | Literal (res ++ " who?")
  'Client ==> 'Server | String
  Done

  
  
data MsgTypes = Tversion | Rversion 
              | Tauth | Rauth 
              | Tattach | Rattach
              | Terror | Rerror -- this is an illegal message
              | Tflush | Rflush
              | Twalk  | Rwalk
              | 

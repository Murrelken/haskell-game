{-# LANGUAGE DeriveGeneric #-}

module Types where

import Data.Aeson
import GHC.Generics

data Game
  = Game {
    gameId :: Int,
    info :: ResponseForWhileTrue,
    gameField :: Field
  } 
  deriving (Eq, Show, Generic)

instance ToJSON Game
instance FromJSON Game

data ResponseForWhileTrue
  = ResponseForWhileTrue {
    isGameStarted :: Bool,
    isGameEnded :: Bool,
    playerTurnNumber :: Int,
    playersCount :: Int,
    changes :: Changes
  }
  deriving (Eq, Show, Generic)

instance ToJSON ResponseForWhileTrue
instance FromJSON ResponseForWhileTrue

data Changes
  = Changes {
    positionX :: Int,
    positionY :: Int,
    playerNumber :: Char
  }
  deriving (Eq, Show, Generic)

instance ToJSON Changes
instance FromJSON Changes

data Field
  = Field {
  size :: Int,
  board :: [String]
} deriving (Eq, Show, Generic)
instance ToJSON Field
instance FromJSON Field

data PlayerAndGameInfo
  = PlayerAndGameInfo {
    gameNumber :: Int,
    givenPlayerNumber :: Int,
    fieldSize :: Int
  }
  deriving (Eq, Show, Generic)

instance ToJSON PlayerAndGameInfo
instance FromJSON PlayerAndGameInfo

data MakeTurnChanges
  = MakeTurnChanges {
    turnChanges :: Changes,
    turnInfo :: PlayerAndGameInfo
  }
  deriving (Eq, Show, Generic)

instance ToJSON MakeTurnChanges
instance FromJSON MakeTurnChanges

data Point
  = Point {
    x :: Int,
    y :: Int
  }
  deriving (Eq, Show, Generic)

instance ToJSON Point
instance FromJSON Point

data IsGameEnded
  = IsGameEnded {
    is :: Bool
  }
  deriving (Eq, Show, Generic)

instance ToJSON IsGameEnded
instance FromJSON IsGameEnded

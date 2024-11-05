use godot::prelude::*;
mod player;
struct GameExt;

#[gdextension]
unsafe impl ExtensionLibrary for GameExt {}
use godot::{
    classes::*, obj::Base, prelude::*
};
#[derive(GodotClass)]
#[class(init,base=CharacterBody2D)]
#[allow(dead_code)]
pub struct Player {
    base: Base<CharacterBody2D>,
    client_id: GString,
    proj_speed: f64,
    bullet_factory: Gd<PackedScene>,
}

#[godot_api]
impl ICharacterBody2D for Player {

    // on load
    fn ready(&mut self) {
        self.bullet_factory = load::<PackedScene>("res://starter_bullet.tscn");

    }

    // every update
    fn physics_process(&mut self, _delta: f64) -> () {
        let mousev2 = self.base().get_viewport().unwrap().get_mouse_position();

        {
            // drop mut ref after use
            self.base_mut().look_at(mousev2);
        }
        
    }

    fn input(&mut self, _event: Gd<InputEvent>) {

    }

}
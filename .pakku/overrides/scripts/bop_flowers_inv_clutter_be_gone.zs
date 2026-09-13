import stdlib.List;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.loot.condition.LootConditions;

val flowers = <tag:block:minecraft:flowers>;

val exceptions = [
    <item:minecraft:chorus_flower>,
    <item:minecraft:mangrove_propagule>,
    <item:minecraft:spore_blossom>,
    <item:minecraft:torchflower_seeds>,
    <item:farm_and_charm:wild_nettle>,
    <item:farm_and_charm:wild_ribwort>,
    <item:farm_and_charm:wild_emmer>,
    <item:farm_and_charm:wild_beetroots>,
    <item:farm_and_charm:wild_potatoes>,
    <item:farm_and_charm:wild_carrots>,
    <item:farm_and_charm:wild_barley>,
    <item:farm_and_charm:wild_corn>,
    <item:farm_and_charm:wild_oat>,
    <item:farm_and_charm:wild_onions>,
    <item:farm_and_charm:wild_lettuce>,
    <item:farm_and_charm:wild_tomatoes>,
    <item:farm_and_charm:wild_strawberries>,
    <item:farmersdelight:wild_cabbages>,
    <item:farmersdelight:wild_onions>,
    <item:farmersdelight:wild_tomatoes>,
    <item:farmersdelight:wild_carrots>,
    <item:farmersdelight:wild_potatoes>,
    <item:farmersdelight:wild_beetroots>,
    <item:farmersdelight:wild_rice>,
    <item:herbalbrews:hibiscus>,
    <item:herbalbrews:lavender>,
    <item:herbalbrews:wild_coffee_plant>,
    <item:herbalbrews:wild_yerba_mate_plant>,
    <item:herbalbrews:wild_rooibos_plant>,
    <item:rusticdelight:wild_cotton>,
    <item:rusticdelight:wild_bell_peppers>,
    <item:rusticdelight:wild_pale_bell_peppers>,
    <item:rusticdelight:wild_dark_bell_peppers>,
    <item:rusticdelight:wild_coffee>,
    <item:ubesdelight:wild_ube>,
    <item:ubesdelight:wild_garlic>,
    <item:ubesdelight:wild_ginger>,
    <item:ubesdelight:wild_lemongrass>
];

val shears = <item:minecraft:shears>.definition.registryName;

loot.modifiers.register(
    "lavendre_flower_shears",
    LootConditions.none(),
    (drops, context) => {
        if (context.blockState != null && context.blockState.block in flowers) {
            val flowerItem = context.blockState.block.asItem().defaultInstance;

            if (flowerItem in exceptions) {
                return drops;
            }

            val newDrops = new List<IItemStack>();

            if (context.tool.definition.registryName == shears) {
                newDrops.add(flowerItem);
            }

            return newDrops;
        }

        return drops;
    }
);
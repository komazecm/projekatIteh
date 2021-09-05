import { Entity, PrimaryGeneratedColumn, Column } from "typeorm";
@Entity()
export class ProductCategory {

    @PrimaryGeneratedColumn() //prim kljuc
    id: number;

    @Column()
    name: string;

}

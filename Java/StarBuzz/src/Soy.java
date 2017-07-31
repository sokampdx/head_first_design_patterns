/**
 * Created by sokam on 7/2/17.
 */
public class Soy extends CondimentDecorator {
  Beverage beverage;

  public Soy(Beverage beverage) {
    this.beverage = beverage;
  }

  public String getDescription() {
    return beverage.getDescription() + ", Soy";
  }

  public double cost() {
    return 0.15 + beverage.cost();
  }
}

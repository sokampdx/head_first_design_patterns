/**
 * Created by sokam on 7/2/17.
 */
public abstract class Beverage {
  String description = "Unknown Beverage";

  public String getDescription() {
    return description;
  }

  public abstract double cost();
}
